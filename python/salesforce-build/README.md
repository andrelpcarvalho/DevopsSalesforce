# Pipeline de Deploy Salesforce — Python

Documentação do pipeline de build e deploy convertido de Bash para Python. Cobre estrutura de arquivos, ordem de execução, como rodar cada script e os principais conceitos da conversão.

---

## Índice

1. [Visão geral](#visão-geral)
2. [Estrutura de arquivos](#estrutura-de-arquivos)
3. [Pré-requisitos](#pré-requisitos)
4. [Como executar](#como-executar)
5. [Descrição de cada script](#descrição-de-cada-script)
6. [Fluxo de rollback](#fluxo-de-rollback)
7. [Conceitos da conversão Bash → Python](#conceitos-da-conversão-bash--python)
8. [Perguntas frequentes](#perguntas-frequentes)

---

## Visão geral

O pipeline executa quatro etapas em sequência para promover alterações do repositório até produção:

```
Build  →  Gera package.xml  →  Training (paralelo)  →  Validação PRD
```

Após a validação em PRD passar, um **Job ID** é salvo. O time segregado de PRD usa esse ID para executar o quick deploy de forma independente.

---

## Estrutura de arquivos

Todos os scripts devem ficar na **mesma pasta**, dentro da pasta raiz `workspace_bash`:

```
workspace_bash/              ← pasta raiz (nome usado para localização dinâmica)
│
├── config.py                ← configurações e caminhos compartilhados
├── pipeline.py              ← orquestrador principal
│
├── build_deploy.py          ← etapa 1: build e cópia de arquivos
├── gerador_package.py       ← etapa 2: gera o package.xml
├── deploy_training.py       ← etapa 3: deploy em Training
├── validate_prd.py          ← etapa 4: validação em PRD
│
├── quick_deploy_prd.py      ← quick deploy (rodado separadamente pelo time de PRD)
│
├── baseline.txt             ← commit hash de referência (não apagar)
│
└── (arquivos gerados em execução)
    ├── deploy_prd_output.log
    ├── deploy_training_output.log
    ├── quick_deploy_prd_output.log
    ├── prd_job_id.txt
    └── commitlist.txt
```

> **Importante:** `baseline.txt` é lido e atualizado pelo pipeline. Nunca apague esse arquivo manualmente — use o rollback se precisar reverter.

---

## Pré-requisitos

- Python 3.10 ou superior
- Salesforce CLI (`sf`) instalado e autenticado
- Git configurado e com acesso ao repositório
- Orgs `devops` e `treino` autenticadas no SF CLI

Verifique as versões antes de rodar:

```bash
python --version
sf --version
git --version
```

---

## Como executar

### Pipeline completo

Roda todas as etapas em sequência (build → package → training + PRD):

```bash
python pipeline.py
```

### Scripts individuais

Cada script pode ser rodado de forma isolada para testes ou reexecução de uma etapa específica:

```bash
python build_deploy.py
python gerador_package.py
python deploy_training.py
python validate_prd.py
```

### Quick deploy em PRD

Rodado **separadamente** pelo time de PRD, após o pipeline ter gerado o Job ID:

```bash
python quick_deploy_prd.py
```

O script lê o `prd_job_id.txt`, valida o formato do Job ID e **pede confirmação manual** antes de executar em produção.

---

## Descrição de cada script

### `config.py` — Configurações compartilhadas

Ponto central de toda configuração do pipeline. Todos os outros scripts importam daqui — nenhum define caminhos por conta própria.

Contém a função `find_project_dir()` que localiza a pasta raiz do projeto dinamicamente, subindo a árvore de diretórios até encontrar a pasta `workspace_bash`. Isso garante que os scripts funcionem independentemente de onde estejam dentro da pasta raiz.

**Se a pasta raiz for renomeada**, basta alterar o parâmetro `marker` neste arquivo:

```python
PROJECT_DIR = find_project_dir("novo_nome_da_pasta")
```

### `pipeline.py` — Orquestrador

Ponto de entrada principal. Controla a ordem de execução, paralelismo e rollback.

- Salva o baseline atual antes de começar (para rollback)
- Chama cada etapa via `subprocess.run([sys.executable, ...])`
- Dispara `deploy_training.py` em uma thread paralela enquanto `validate_prd.py` roda de forma síncrona
- Aguarda o training terminar após o PRD com `thread.join()`
- Atualiza o `baseline.txt` **somente após** o PRD passar
- Erros em qualquer etapa acionam o rollback automaticamente

### `build_deploy.py` — Build

- Lê o `baseline.txt` para obter o commit de referência
- Faz `git checkout`, `fetch` e `pull` na branch de release
- Gera listas de arquivos adicionados, modificados e deletados via `git diff`
- Copia os arquivos modificados para a pasta `build_deploy/`, respeitando o tipo:

| Tipo de arquivo | Comportamento |
|---|---|
| `.cls` / `.trigger` | Copia junto com o `-meta.xml` |
| Pasta `/aura/` ou `/lwc/` | Copia a pasta inteira do componente |
| Pasta `/experiences/` | Copia pasta + `site-meta.xml` |
| Outros | Cópia direta preservando a estrutura |

### `gerador_package.py` — Package XML

Roda `sf project generate manifest` apontando para a pasta de build.

### `deploy_training.py` — Deploy Training

Executa `sf project deploy start` para a org `treino` com `RunLocalTests`. Grava o log em `deploy_training_output.log`. Falhas são reportadas pelo `pipeline.py` como aviso — não abortam o pipeline.

### `validate_prd.py` — Validação PRD

Executa `sf project deploy validate` para a org `devops`. Ao final, extrai o **Job ID** do log com regex e salva em `prd_job_id.txt`. Falhas aqui acionam rollback.

### `quick_deploy_prd.py` — Quick Deploy PRD

Lê o Job ID salvo, valida o formato (`0Af` + 15 caracteres alfanuméricos), pede confirmação interativa e executa `sf project deploy quick`. Após sucesso, apaga o `prd_job_id.txt` para evitar reuso acidental.

---

## Fluxo de rollback

Se qualquer etapa falhar, o `pipeline.py` restaura o `baseline.txt` para o valor que estava **antes** do pipeline começar:

```
[1] Pipeline inicia → salva baseline atual como backup
[2] Etapa falha → baseline.txt é restaurado para o backup
[3] Pipeline encerra com exit code 1
[4] Nenhuma alteração é promovida
```

O rollback é automático para falhas de exit code e para erros detectados no log do PRD. O training **não** aciona rollback — falhas nele são apenas informativas.

---

## Conceitos da conversão Bash → Python

### Localização dinâmica do script — `BASH_SOURCE` → `Path(__file__)`

Em bash, `${BASH_SOURCE[0]}` retorna o caminho do script em execução. Em Python o equivalente é `__file__`, sempre disponível automaticamente:

```python
SCRIPT_DIR = Path(__file__).resolve().parent
```

O `.resolve()` garante que o caminho seja absoluto, resolvendo symlinks. O `.parent` pega a pasta onde o arquivo está — equivalente ao `dirname` do bash.

### Localização da pasta raiz — `sed` → `find_project_dir()`

O bash usava `sed` para extrair o prefixo até `workspace_bash` no caminho:

```bash
PROJECT_DIR="$(echo "$FULL_PATH" | sed -E 's|(.*workspace_bash).*|\1|')"
```

Em Python isso é feito subindo a árvore de diretórios até encontrar a pasta pelo nome, o que funciona independentemente da estrutura interna:

```python
def find_project_dir(marker: str = "workspace_bash") -> Path:
    current = Path(__file__).resolve().parent
    for folder in [current, *current.parents]:
        if folder.name == marker:
            return folder
    raise RuntimeError(f"Pasta '{marker}' não encontrada.")
```

Se alguém mover os scripts para uma subpasta dentro de `workspace_bash`, a função ainda encontra a raiz corretamente. Se a pasta raiz for renomeada, basta mudar o `marker` em `config.py` — um único lugar.

### `$?` e `${PIPESTATUS[0]}` → `returncode`

Em bash, `$?` captura o exit code do último comando. Com `subprocess`:

```python
result = subprocess.run([...])
if result.returncode != 0:
    sys.exit(result.returncode)
```

### `command 2>&1 | tee arquivo.log` → `Popen` com loop de leitura

O `tee` do bash exibe e grava ao mesmo tempo. Em Python isso é feito lendo linha a linha do `stdout` do processo:

```python
with subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True) as proc, \
     open("arquivo.log", "w") as log:
    for line in proc.stdout:
        print(line, end="")   # exibe em tempo real
        log.write(line)       # grava no log
```

### `command &` e `wait $PID` → `threading.Thread` e `.join()`

O `&` do bash cria um processo em background. Em Python o equivalente para esse caso é uma thread:

```python
thread = threading.Thread(target=run_training)
thread.start()
# ... faz outras coisas ...
thread.join()  # equivalente ao wait $PID
```

### `grep -oE` → `re.search`

A extração do Job ID com dois `grep` encadeados vira uma regex direta:

```python
# Bash: grep -oE '[0-9A-Za-z]{18}' | grep -E '^0Af' | head -1
match = re.search(r'\b(0Af[0-9A-Za-z]{15})\b', line)
```

### `if [[ ! -f arquivo ]]` → `Path.exists()`

```python
if not Path("baseline.txt").exists():
    sys.exit(1)
```

### `rm -f arquivo` → `Path.unlink(missing_ok=True)`

```python
Path("arquivo.log").unlink(missing_ok=True)  # não lança erro se não existir
```

### `if __name__ == "__main__"` — por que está em todo script

Garante que a função `main()` só executa quando o script é chamado diretamente (`python script.py`), e não quando outro módulo o importa:

```python
def main():
    ...

if __name__ == "__main__":
    main()
```

---

## Perguntas frequentes

**O que acontece se a pasta raiz for renomeada?**
Abra `config.py` e altere o parâmetro `marker` na chamada de `find_project_dir()`. É o único lugar que precisa ser atualizado — todos os outros scripts importam de lá.

**O pipeline pode ser interrompido no meio?**
Sim. Se interrompido antes do PRD passar, o `baseline.txt` não terá sido atualizado — permanece no valor original. Se interrompido depois, o baseline já terá sido atualizado. Em caso de dúvida, verifique o conteúdo do arquivo antes de reexecutar.

**O que acontece se o training falhar?**
O pipeline reporta o erro como `[AVISO]` mas continua normalmente. O training não bloqueia nem aborta o pipeline — apenas o PRD tem essa responsabilidade.

**Posso rodar `quick_deploy_prd.py` mais de uma vez com o mesmo Job ID?**
Não. O Job ID do Salesforce expira em 10 horas após a validação. Além disso, após um quick deploy bem-sucedido o script apaga o `prd_job_id.txt` automaticamente para evitar reuso acidental.

**Como reexecutar apenas uma etapa sem rodar o pipeline todo?**
Rode o script da etapa diretamente: `python validate_prd.py`. Mas atenção: os scripts dependem de artefatos das etapas anteriores (pasta de build, logs, job id). Certifique-se de que esses arquivos existem antes de pular etapas.
