#!/usr/bin/env python3
"""
deploy_training.py
Etapa 3: deploy em Training (roda em paralelo ao PRD).
"""

import subprocess
import sys

from config import LOG_TRAINING, SOURCE_DIR


def main() -> None:
    LOG_TRAINING.unlink(missing_ok=True)

    print("Comando de deploy em Training")

    cmd = [
        "sf", "project", "deploy", "start",
        "--source-dir", str(SOURCE_DIR),
        "--target-org", "treino",
        "--test-level", "RunLocalTests",
        "-w", "240",
        "--ignore-conflicts",
        "--verbose",
    ]

    with (
        subprocess.Popen(
            cmd,
            stdout=subprocess.PIPE,
            stderr=subprocess.STDOUT,
            text=True,
        ) as proc,
        LOG_TRAINING.open("w") as log,
    ):
        for line in proc.stdout:
            print(line, end="")
            log.write(line)

    if proc.returncode != 0:
        print(f"[ERRO] Deploy em Training falhou com exit code {proc.returncode}.")
        sys.exit(proc.returncode)

    print("Deploy em Training concluído com sucesso.")


if __name__ == "__main__":
    main()
