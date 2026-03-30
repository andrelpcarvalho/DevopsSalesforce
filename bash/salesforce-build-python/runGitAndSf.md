# Como o Python executa comandos externos

Explica como o pipeline chama o `sf` CLI, o `git` e qualquer outro programa externo — o mecanismo é o mesmo para todos.

---

## Índice

1. [O conceito](#o-conceito)
2. [Como o Python encontra o comando](#como-o-python-encontra-o-comando)
3. [As três formas usadas no pipeline](#as-três-formas-usadas-no-pipeline)
4. [Git funciona igual ao sf?](#git-funciona-igual-ao-sf)
5. [Comparação bash × Python](#comparação-bash--python)
6. [Erros comuns](#erros-comuns)

---

## O conceito

O `sf` e o `git` são programas instalados no sistema operacional — binários comuns, como qualquer outro. O Python não os executa "por dentro": ele pede ao sistema operacional que rode o programa, exatamente como se você tivesse digitado no terminal.

O módulo que faz isso é o `subprocess`, disponível na biblioteca padrão do Python (não precisa instalar nada).

```
seu_script.py
    │
    └── subprocess.run(["sf", "project", "deploy", "start", ...])
            │
            └── Sistema Operacional
                    │
                    └── sf  ←  binário no PATH
                            │
                            └── Salesforce CLI executa normalmente
```

O `sf` não sabe que foi chamado por Python. Ele recebe os argumentos e roda como se você tivesse digitado no terminal.

---

## Como o Python encontra o comando

O Python usa o `PATH` do sistema — a mesma variável de ambiente que o terminal usa. Se o comando funciona no terminal, funciona pelo `subprocess` também.

```bash
# Se isso funciona no terminal...
sf --version
git --version

# ...isso funciona no Python também
subprocess.run(["sf", "--version"])
subprocess.run(["git", "--version"])
```

A lista passada para o `subprocess` é só o jeito Python de separar os argumentos — cada palavra vira um item:

```python
# Bash
sf project deploy start --target-org treino -w 240

# Python (cada palavra/argumento é um item da lista)
["sf", "project", "deploy", "start", "--target-org", "treino", "-w", "240"]
```

---

## As três formas usadas no pipeline

### 1. `subprocess.run` — exit code apenas

Usada quando só importa saber se o comando passou ou falhou. O output aparece direto no terminal mas não é capturado pelo Python.

```python
result = subprocess.run(["sf", "project", "generate", "manifest", "--source-dir", str(BUILD_DIR)])

if result.returncode != 0:
    print("[ERRO] Falha ao gerar package.xml.")
    sys.exit(1)
```

Equivalente bash:
```bash
sf project generate manifest --source-dir "$BUILD_DIR"
if [[ $? -ne 0 ]]; then
    echo "[ERRO] Falha ao gerar package.xml."
    exit 1
fi
```

---

### 2. `subprocess.Popen` com loop — saída em tempo real + log

Usada para comandos longos (deploys, validações) que precisam mostrar progresso no terminal e gravar no log ao mesmo tempo. Equivale ao `2>&1 | tee arquivo.log` do bash.

```python
with (
    subprocess.Popen(
        cmd,
        stdout=subprocess.PIPE,
        stderr=subprocess.STDOUT,  # equivalente ao 2>&1
        text=True,
    ) as proc,
    open("deploy.log", "w") as log,
):
    for line in proc.stdout:
        print(line, end="")   # exibe em tempo real no terminal
        log.write(line)       # grava no arquivo de log
```

Equivalente bash:
```bash
sf project deploy start ... 2>&1 | tee deploy.log
EXIT_CODE=${PIPESTATUS[0]}
```

> **Por que `Popen` e não `run`?**
> O `subprocess.run` espera o comando terminar para devolver qualquer coisa.
> O `Popen` permite ler a saída linha a linha enquanto o processo ainda está rodando — por isso conseguimos exibir e gravar ao mesmo tempo.

---

### 3. `subprocess.run` com `capture_output=True` — captura como string

Usada quando a saída precisa ser lida pelo Python como texto (não exibida, não gravada em arquivo). Muito usado com os comandos `git`.

```python
result = subprocess.run(
    ["git", "rev-parse", "HEAD"],
    capture_output=True,   # captura stdout e stderr
    text=True,             # retorna como string (não bytes)
    check=True,            # lança exceção se returncode != 0
)

novo_baseline = result.stdout.strip()  # usa o valor como variável Python
```

Equivalente bash:
```bash
NOVO_BASELINE=$(git rev-parse HEAD)
```

---

## Git funciona igual ao sf?

Sim — exatamente o mesmo mecanismo. O `git` também é um binário externo instalado no PATH. Todos os comandos git do pipeline usam `subprocess`:

| Bash | Python |
|---|---|
| `git checkout $BRANCH` | `subprocess.run(["git", "checkout", BRANCH])` |
| `git fetch` | `subprocess.run(["git", "fetch"])` |
| `git pull` | `subprocess.run(["git", "pull"])` |
| `HASH=$(git rev-parse HEAD)` | `result = subprocess.run(["git", "rev-parse", "HEAD"], capture_output=True, text=True)` |
| `git diff --name-status $HASH HEAD` | `subprocess.run(["git", "diff", "--name-status", commit_hash, "HEAD"], capture_output=True, text=True)` |

A única diferença prática é que o bash captura saída com `$()` enquanto o Python usa `capture_output=True` e lê `result.stdout`.

### Exemplo: como o pipeline lê o `git diff`

```python
result = subprocess.run(
    ["git", "diff", "--name-status", commit_hash, "HEAD"],
    capture_output=True,
    text=True,
    check=True,
)

# result.stdout é uma string com o output completo
# processamos linha a linha em Python puro
for line in result.stdout.splitlines():
    status, *parts = line.split("\t")
    filepath = parts[-1]

    if status.startswith("D"):
        deleted.append(filepath)
    elif status.startswith("A"):
        added.append(filepath)
    elif status.startswith("M"):
        modified.append(filepath)
```

No bash isso seria feito com `grep`, `cut` e redirecionamentos para arquivos temporários. Em Python a saída fica em memória como string e é processada diretamente.

---

## Comparação bash × Python

| Conceito bash | Equivalente Python | Observação |
|---|---|---|
| `comando arg1 arg2` | `subprocess.run(["comando", "arg1", "arg2"])` | Cada argumento é um item da lista |
| `$?` | `result.returncode` | Exit code do último comando |
| `${PIPESTATUS[0]}` | `proc.returncode` após fechar o `Popen` | Exit code com pipe |
| `2>&1` | `stderr=subprocess.STDOUT` | Redireciona stderr para stdout |
| `cmd \| tee arquivo.log` | `Popen` + loop lendo `proc.stdout` | Exibe e grava simultaneamente |
| `OUTPUT=$(comando)` | `subprocess.run(..., capture_output=True).stdout` | Captura saída como string |
| `check=True` (não existe no bash) | `check=True` no `subprocess.run` | Lança exceção automática se falhar |

---

## Erros comuns

**`FileNotFoundError: [Errno 2] No such file or directory: 'sf'`**
O comando `sf` não está no PATH. Verifique se o Salesforce CLI está instalado e se o terminal onde você roda o Python tem o PATH configurado corretamente.

**O comando roda no terminal mas não pelo Python**
Geralmente é problema de PATH. Alguns ambientes (IDEs, cron, serviços) têm um PATH diferente do terminal interativo. Verifique com:
```python
import subprocess
result = subprocess.run(["which", "sf"], capture_output=True, text=True)
print(result.stdout)  # mostra onde o sf está instalado
```

**A saída não aparece em tempo real**
Você está usando `subprocess.run` com `capture_output=True` — isso segura tudo até o fim. Para saída em tempo real, use `Popen` com o loop de leitura linha a linha (forma 2).

**Argumentos com espaços**
No bash, argumentos com espaços precisam de aspas: `--message "meu texto"`. Em Python, o espaço não é problema porque cada argumento já é um item separado da lista:
```python
# Certo
subprocess.run(["git", "commit", "-m", "meu texto com espaços"])

# Errado — o Python vai interpretar como um único argumento
subprocess.run(["git", "commit", "-m 'meu texto'"])
```