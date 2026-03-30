#!/bin/bash
# ══════════════════════════════════════════════════════════
#  quickDeployPrd.sh
#  Executado pelo time segregado de PRD após validação.
#  Lê o Job ID gravado pelo deployPrd.sh e faz o quick deploy.
# ══════════════════════════════════════════════════════════

FULL_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
JOB_ID_FILE="$FULL_PATH/prd_job_id.txt"
LOG_FILE="$FULL_PATH/quick_deploy_prd_output.log"

echo ""
echo "╔══════════════════════════════════════════════╗"
echo "║         QUICK DEPLOY EM PRODUÇÃO             ║"
echo "╚══════════════════════════════════════════════╝"
echo ""

# ── Verifica se o arquivo com o Job ID existe ──
if [[ ! -f "$JOB_ID_FILE" ]]; then
    echo "[ERRO] Arquivo prd_job_id.txt não encontrado."
    echo "       Execute o pipeline (deploy.sh) antes de rodar este script."
    exit 1
fi

JOB_ID=$(<"$JOB_ID_FILE")

if [[ -z "$JOB_ID" ]]; then
    echo "[ERRO] prd_job_id.txt está vazio. Nenhum Job ID disponível."
    exit 1
fi

echo "[INFO] Job ID encontrado: $JOB_ID"
echo "[INFO] Verificando validade do Job ID (validate expira em 10 horas)..."

# ── Verifica se o Job ID tem o formato correto (18 chars, prefixo 0Af) ──
if ! echo "$JOB_ID" | grep -qE '^0Af[0-9A-Za-z]{15}$'; then
    echo "[ERRO] Job ID com formato inválido: $JOB_ID"
    echo "       Esperado: 18 caracteres começando com 0Af"
    exit 1
fi

# ── Confirmação manual antes de executar em PRD ──
echo ""
echo "  Org alvo  : devops (Production)"
echo "  Job ID    : $JOB_ID"
echo ""
read -rp "  Confirma o quick deploy em PRODUÇÃO? [s/N] " CONFIRM
CONFIRM=$(echo "$CONFIRM" | tr '[:upper:]' '[:lower:]')

if [[ "$CONFIRM" != "s" && "$CONFIRM" != "sim" ]]; then
    echo "[CANCELADO] Quick deploy não executado."
    exit 0
fi

echo ""
echo "[INFO] Iniciando quick deploy em PRD..."
rm -f "$LOG_FILE"

sf project deploy quick \
    --job-id "$JOB_ID" \
    --target-org devops \
    -w 240 \
    --verbose 2>&1 | tee "$LOG_FILE"

EXIT_CODE=${PIPESTATUS[0]}

echo ""
if [[ $EXIT_CODE -eq 0 ]]; then
    # ── Verifica também no log por mensagens de erro ──
    if grep -qiE "deploy failed|error|exception" "$LOG_FILE" 2>/dev/null; then
        echo "╔══════════════════════════════════════════════╗"
        echo "║  [AVISO] Deploy concluído com warnings.      ║"
        echo "║  Verifique quick_deploy_prd_output.log       ║"
        echo "╚══════════════════════════════════════════════╝"
    else
        # Limpa o Job ID após deploy bem-sucedido para evitar reuso acidental
        rm -f "$JOB_ID_FILE"
        echo "╔══════════════════════════════════════════════╗"
        echo "║  QUICK DEPLOY EM PRD CONCLUÍDO COM SUCESSO   ║"
        echo "║  prd_job_id.txt removido (evita reuso)       ║"
        echo "╚══════════════════════════════════════════════╝"
    fi
else
    echo "╔══════════════════════════════════════════════╗"
    echo "║  [ERRO] Quick deploy falhou.                 ║"
    echo "║  Exit code : $EXIT_CODE                           ║"
    echo "║  Verifique : quick_deploy_prd_output.log     ║"
    echo "╚══════════════════════════════════════════════╝"
    exit $EXIT_CODE
fi

exit 0
