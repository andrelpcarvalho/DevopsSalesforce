#!/usr/bin/env python3
"""
quick_deploy_prd.py
Executado pelo time segregado de PRD após validação.
Lê o Job ID gravado pelo validate_prd.py e faz o quick deploy.
"""

import re
import subprocess
import sys

from config import JOB_ID_FILE, LOG_QUICK_DEPLOY


ERROR_PATTERN = re.compile(r"Status\s*:\s*Failed", re.IGNORECASE)


def main() -> None:
    print()
    print("╔══════════════════════════════════════════════╗")
    print("║         QUICK DEPLOY EM PRODUÇÃO             ║")
    print("╚══════════════════════════════════════════════╝")
    print()

    if not JOB_ID_FILE.exists():
        print("[ERRO] Arquivo prd_job_id.txt não encontrado.")
        print("       Execute o pipeline (pipeline.py) antes de rodar este script.")
        sys.exit(1)

    job_id = JOB_ID_FILE.read_text().strip()

    if not job_id:
        print("[ERRO] prd_job_id.txt está vazio. Nenhum Job ID disponível.")
        sys.exit(1)

    print(f"[INFO] Job ID encontrado: {job_id}")
    print("[INFO] Verificando validade do Job ID (validate expira em 10 horas)...")

    if not re.fullmatch(r'0Af[0-9A-Za-z]{15}', job_id):
        print(f"[ERRO] Job ID com formato inválido: {job_id}")
        print("       Esperado: 18 caracteres começando com 0Af")
        sys.exit(1)

    print()
    print("  Org alvo  : devops (Production)")
    print(f"  Job ID    : {job_id}")
    print()

    confirm = input("  Confirma o quick deploy em PRODUÇÃO? [s/N] ").strip().lower()

    if confirm not in ("s", "sim"):
        print("[CANCELADO] Quick deploy não executado.")
        sys.exit(0)

    print()
    print("[INFO] Iniciando quick deploy em PRD...")
    LOG_QUICK_DEPLOY.unlink(missing_ok=True)

    cmd = [
        "sf", "project", "deploy", "quick",
        "--job-id", job_id,
        "--target-org", "devops",
        "-w", "240",
        "--verbose",
    ]

    with (
        subprocess.Popen(
            cmd,
            stdout=subprocess.PIPE,
            stderr=subprocess.STDOUT,
            text=True,
        ) as proc,
        LOG_QUICK_DEPLOY.open("w") as log,
    ):
        for line in proc.stdout:
            print(line, end="")
            log.write(line)

    print()
    if proc.returncode == 0:
        if ERROR_PATTERN.search(LOG_QUICK_DEPLOY.read_text()):
            print("╔══════════════════════════════════════════════╗")
            print("║  [AVISO] Deploy concluído com warnings.      ║")
            print("║  Verifique quick_deploy_prd_output.log       ║")
            print("╚══════════════════════════════════════════════╝")
        else:
            JOB_ID_FILE.unlink(missing_ok=True)
            print("╔══════════════════════════════════════════════╗")
            print("║  QUICK DEPLOY EM PRD CONCLUÍDO COM SUCESSO   ║")
            print("║  prd_job_id.txt removido (evita reuso)       ║")
            print("╚══════════════════════════════════════════════╝")
    else:
        print("╔══════════════════════════════════════════════╗")
        print("║  [ERRO] Quick deploy falhou.                 ║")
        print(f"║  Exit code : {proc.returncode:<32}║")
        print("║  Verifique : quick_deploy_prd_output.log     ║")
        print("╚══════════════════════════════════════════════╝")
        sys.exit(proc.returncode)


if __name__ == "__main__":
    main()
