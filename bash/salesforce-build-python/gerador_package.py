#!/usr/bin/env python3
"""
gerador_package.py
Etapa 2: gera o package.xml a partir da pasta de build.
"""

import subprocess
import sys

from config import BUILD_DIR


def main() -> None:
    print("Gerando package.xml...")

    result = subprocess.run(
        ["sf", "project", "generate", "manifest", "--source-dir", str(BUILD_DIR)]
    )

    if result.returncode != 0:
        print("[ERRO] Falha ao gerar package.xml.")
        sys.exit(1)

    print("package.xml gerado com sucesso.")


if __name__ == "__main__":
    main()
