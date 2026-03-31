import subprocess

resultado = subprocess.run(
    ["sf", "--version"],
    capture_output=True,
    shell=True, 
    text=True
)

print("Código de retorno:", resultado.returncode)
print("Saída:")
print(resultado.stdout)
print("Erro (se houver):")
print(resultado.stderr)