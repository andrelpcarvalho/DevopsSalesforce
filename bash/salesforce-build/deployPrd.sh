#!/bin/bash
FULL_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(echo "$FULL_PATH" | sed -E 's|(.*workspace_bash).*|\1|')"
project_name="build_deploy"

# Limpa log anterior
rm -f "$FULL_PATH/deploy_prd_output.log"
rm -f "$FULL_PATH/prd_job_id.txt"

echo "Comando de validação em PRD"

# Roda de forma SÍNCRONA (sem &) para capturar exit code e Job ID
sf project deploy validate \
    --source-dir "$PROJECT_DIR/$project_name/force-app/main/default" \
    --target-org devops \
    -w 240 \
    --verbose 2>&1 | tee "$FULL_PATH/deploy_prd_output.log"

EXIT_CODE=${PIPESTATUS[0]}

if [[ $EXIT_CODE -ne 0 ]]; then
    echo "[ERRO] Validate em PRD falhou com exit code $EXIT_CODE."
    exit $EXIT_CODE
fi

# ── Extrai Job ID automaticamente do log ──
# O SF CLI imprime o Job ID no formato 0AfXXXXXXXXXXXXXXX (18 chars, prefixo 0Af)
JOB_ID=$(grep -oE '[0-9A-Za-z]{18}' "$FULL_PATH/deploy_prd_output.log" \
    | grep -E '^0Af' | head -1)

if [[ -n "$JOB_ID" ]]; then
    echo "$JOB_ID" > "$FULL_PATH/prd_job_id.txt"
    echo "[INFO] Job ID salvo em prd_job_id.txt: $JOB_ID"
else
    echo "[AVISO] Job ID não encontrado no log. Quick deploy deverá ser feito manualmente."
fi

echo "Validação em PRD concluída."
exit 0
