#!/bin/bash
FULL_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

build="$FULL_PATH/deployBuild.sh"
xml="$FULL_PATH/geradorPackage.sh"
treino="$FULL_PATH/deployTraining.sh"
producao="$FULL_PATH/deployPrd.sh"

# ── Verifica que baseline.txt existe antes de qualquer coisa ──
if [[ ! -f "$FULL_PATH/baseline.txt" ]]; then
    echo "[ERRO] baseline.txt não encontrado. Abortando."
    exit 1
fi

# ── Salva o baseline atual para rollback ──
BASELINE_BACKUP=$(<"$FULL_PATH/baseline.txt")
echo "[INFO] Baseline salvo para rollback: $BASELINE_BACKUP"

# ── Função de rollback: restaura baseline e aborta ──
rollback() {
    local etapa="$1"
    echo ""
    echo "╔══════════════════════════════════════════════╗"
    echo "║  ERRO NA ETAPA: $etapa"
    echo "║  Restaurando baseline.txt → $BASELINE_BACKUP"
    echo "╚══════════════════════════════════════════════╝"
    echo "$BASELINE_BACKUP" > "$FULL_PATH/baseline.txt"
    echo "[INFO] Rollback concluído. Nenhuma alteração foi promovida."
    exit 1
}

# ── ETAPA 1: Build ──
echo ""
echo "==> [1/4] Executando build..."
bash "$build"
if [[ $? -ne 0 ]]; then
    rollback "deployBuild.sh (exit code diferente de 0)"
fi

# ── ETAPA 2: Gerar package.xml ──
echo ""
echo "==> [2/4] Gerando package.xml..."
bash "$xml"
if [[ $? -ne 0 ]]; then
    rollback "geradorPackage.sh (exit code diferente de 0)"
fi

# ── ETAPA 3: Dispara Training em background (não bloqueia PRD) ──
echo ""
echo "==> [3/4] Disparando deploy em Training (paralelo ao PRD)..."
bash "$treino" &
TREINO_PID=$!
echo "[INFO] Training rodando em background (PID: $TREINO_PID)"

# ── ETAPA 4: Deploy/Validate em PRD (síncrono, é ele quem decide o pipeline) ──
echo ""
echo "==> [4/4] Validação em PRD..."
bash "$producao"
PRD_EXIT=$?

wait "$TREINO_PID"
TREINO_EXIT=$?

if [[ $PRD_EXIT -ne 0 ]]; then
    rollback "deployPrd.sh (exit code diferente de 0)"
fi

# Verifica o log de PRD por erros
if grep -qiE "error|failed|exception|deploy failed" "$FULL_PATH/deploy_prd_output.log" 2>/dev/null; then
    echo "[ERRO] Erros detectados no deploy_prd_output.log:"
    grep -iE "error|failed|exception|deploy failed" "$FULL_PATH/deploy_prd_output.log" | head -20
    rollback "deployPrd validate (erros encontrados no log)"
fi
echo "[OK] Validação em PRD concluída sem erros."

# ── Verifica resultado do Training (apenas informativo, não aborta) ──
echo ""
if [[ $TREINO_EXIT -ne 0 ]]; then
    echo "[AVISO] Training terminou com exit code $TREINO_EXIT — verifique deploy_training_output.log"
elif grep -qiE "error|failed|exception|deploy failed" "$FULL_PATH/deploy_training_output.log" 2>/dev/null; then
    echo "[AVISO] Training concluído mas com erros no log — verifique deploy_training_output.log"
else
    echo "[OK] Deploy em Training concluído sem erros."
fi

# ── Só atualiza baseline APÓS PRD ter passado ──
echo "$NOVO_BASELINE" > "$FULL_PATH/baseline.txt"
echo "[INFO] baseline.txt atualizado para: $NOVO_BASELINE"

# ── Extrai Job ID do log de PRD para o quick deploy manual ──
JOB_ID=$(grep -oE '[0-9A-Za-z]{18}' "$FULL_PATH/deploy_prd_output.log" \
    | grep -E '^0Af' | head -1)

if [[ -n "$JOB_ID" ]]; then
    echo "$JOB_ID" > "$FULL_PATH/prd_job_id.txt"
    echo ""
    echo "╔══════════════════════════════════════════════════════════════╗"
    echo "║  PIPELINE CONCLUÍDO COM SUCESSO                              ║"
    echo "║  Job ID para quick deploy: $JOB_ID  ║"
    echo "║  Execute pelo time de PRD: bash quickDeployPrd.sh            ║"
    echo "╚══════════════════════════════════════════════════════════════╝"
else
    echo ""
    echo "[AVISO] Job ID não encontrado no log. Verifique deploy_prd_output.log manualmente."
    echo "[INFO]  Pipeline concluído. Baseline atualizado."
fi

echo ""
echo "Fim da execução."