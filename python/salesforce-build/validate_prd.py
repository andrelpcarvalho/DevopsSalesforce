#!/usr/bin/env python3
"""
validate_prd.py
Etapa 4: validação em PRD. Extrai e salva o Job ID para o quick deploy.
"""

import re
import subprocess
import sys

from config import JOB_ID_FILE, LOG_PRD, SOURCE_DIR


def main() -> None:
    LOG_PRD.unlink(missing_ok=True)
    JOB_ID_FILE.unlink(missing_ok=True)

    print("Comando de validação em PRD")

    cmd = [
        "sf", "project", "deploy", "validate",
        "--source-dir", str(SOURCE_DIR),
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
        LOG_PRD.open("w") as log,
    ):
        for line in proc.stdout:
            print(line, end="")
            log.write(line)

    if proc.returncode != 0:
        print(f"[ERRO] Validate em PRD falhou com exit code {proc.returncode}.")
        sys.exit(proc.returncode)

    # Extrai Job ID do arquivo de log — evita acumular linhas em memória.
    job_id: str | None = None
    for line in LOG_PRD.read_text().splitlines():
        match = re.search(r'\b(0Af[0-9A-Za-z]{15})\b', line)
        if match:
            job_id = match.group(1)
            break

    if job_id:
        JOB_ID_FILE.write_text(job_id + "\n")
        print(f"[INFO] Job ID salvo em prd_job_id.txt: {job_id}")
    else:
        print("[AVISO] Job ID não encontrado no log. Quick deploy deverá ser feito manualmente.")

    print("Validação em PRD concluída.")


if __name__ == "__main__":
    main()
