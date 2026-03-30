#!/bin/bash
FULL_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(echo "$FULL_PATH" | sed -E 's|(.*workspace_bash).*|\1|')"
project_name="build_deploy"

# Limpa log anterior
rm -f "$FULL_PATH/deploy_training_output.log"

echo "Comando de deploy em Training"

# Roda de forma SÍNCRONA (sem &) para que o exit code seja capturado corretamente
sf project deploy start \
    --source-dir "$PROJECT_DIR/$project_name/force-app/main/default" \
    --target-org "treino" \
    --test-level RunLocalTests \
    -w 240 \
    --ignore-conflicts \
    --verbose 2>&1 | tee "$FULL_PATH/deploy_training_output.log"

EXIT_CODE=${PIPESTATUS[0]}

if [[ $EXIT_CODE -ne 0 ]]; then
    echo "[ERRO] Deploy em Training falhou com exit code $EXIT_CODE."
    exit $EXIT_CODE
fi

echo "Deploy em Training concluído com sucesso."
exit 0
