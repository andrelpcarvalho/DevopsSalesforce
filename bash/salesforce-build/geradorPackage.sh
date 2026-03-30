#!/bin/bash
FULL_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(echo "$FULL_PATH" | sed -E 's|(.*workspace_bash).*|\1|')"
project_name="build_deploy"
BUILD_DIR="${PROJECT_DIR}${project_name}\\"

echo "Gerando package.xml..."
sf project generate manifest --source-dir "$BUILD_DIR"

if [[ $? -ne 0 ]]; then
    echo "[ERRO] Falha ao gerar package.xml."
    exit 1
fi

echo "package.xml gerado com sucesso."
exit 0
