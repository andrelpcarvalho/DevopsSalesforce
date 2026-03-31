#!/usr/bin/env python3
"""
config.py
Configurações e utilitários compartilhados por todos os scripts do pipeline.
Importe este módulo no início de cada script para garantir caminhos consistentes.
"""

from pathlib import Path


# ── Resolução dinâmica de caminhos ─────────────────────────────────────────

def find_project_dir(marker: str = "workspace_bash") -> Path:
    """
    Sobe na árvore de diretórios a partir deste arquivo até encontrar
    a pasta com o nome indicado em `marker`.

    Equivalente ao bash:
        PROJECT_DIR="$(echo "$FULL_PATH" | sed -E 's|(.*workspace_bash).*|\\1|')"

    Se alguém renomear a pasta raiz, basta mudar o valor de `marker` aqui.
    """
    current = Path(__file__).resolve().parent
    for folder in [current, *current.parents]:
        if folder.name == marker:
            return folder
    raise RuntimeError(
        f"Pasta raiz '{marker}' não encontrada na hierarquia de diretórios.\n"
        f"Verifique se os scripts estão dentro de '{marker}' ou ajuste o marker em config.py."
    )


SCRIPT_DIR  = Path(__file__).resolve().parent
PROJECT_DIR = find_project_dir("workspace_bash")
LOCAL_DIR = PROJECT_DIR / "sforce-sfdc-bvsa-organization"

# ── Nomes e pastas ─────────────────────────────────────────────────────────

PROJECT_NAME = "build_deploy"
BRANCH       = "release-v4.0.0"

BUILD_DIR  = PROJECT_DIR / PROJECT_NAME
SOURCE_DIR = BUILD_DIR / "force-app" / "main" / "default"

# ── Arquivos de estado ─────────────────────────────────────────────────────

BASELINE_FILE = PROJECT_DIR / "baseline.txt"
JOB_ID_FILE   = PROJECT_DIR / "prd_job_id.txt"

# ── Logs ───────────────────────────────────────────────────────────────────

LOG_PRD          = PROJECT_DIR / "deploy_prd_output.log"
LOG_TRAINING     = PROJECT_DIR / "deploy_training_output.log"
LOG_QUICK_DEPLOY = PROJECT_DIR / "quick_deploy_prd_output.log"
