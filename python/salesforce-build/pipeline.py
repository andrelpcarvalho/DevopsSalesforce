#!/usr/bin/env python3
"""
pipeline.py
Orquestrador principal do pipeline de deploy.
Chama build → package.xml → training (paralelo) → PRD (síncrono).
"""

import os
import re
import subprocess
import sys
import threading
from pathlib import Path

from config import BASELINE_FILE, JOB_ID_FILE, LOG_PRD, LOG_TRAINING, SCRIPT_DIR


# ── Utilitários ────────────────────────────────────────────────────────────

def run_script(path: Path) -> int:
    """Executa um script Python e retorna o exit code."""
    result = subprocess.run([sys.executable, str(path)])
    return result.returncode


ERROR_PATTERN = re.compile(r"Status\s*:\s*Failed", re.IGNORECASE)


def log_has_errors(log_path: Path) -> bool:
    if not log_path.exists():
        return False
    return any(ERROR_PATTERN.search(line) for line in log_path.read_text().splitlines())


def print_errors_from_log(log_path: Path, max_lines: int = 20) -> None:
    for line in log_path.read_text().splitlines():
        if ERROR_PATTERN.search(line):
            print(f"  {line}")
            max_lines -= 1
            if max_lines == 0:
                break


def rollback(etapa: str, baseline_backup: str) -> None:
    print()
    print("╔══════════════════════════════════════════════╗")
    print(f"║  ERRO NA ETAPA: {etapa}")
    print(f"║  Restaurando baseline.txt → {baseline_backup}")
    print("╚══════════════════════════════════════════════╝")
    BASELINE_FILE.write_text(baseline_backup + "\n")
    print("[INFO] Rollback concluído. Nenhuma alteração foi promovida.")
    sys.exit(1)


def extract_job_id(log_path: Path) -> str | None:
    if not log_path.exists():
        return None
    for line in log_path.read_text().splitlines():
        match = re.search(r'\b(0Af[0-9A-Za-z]{15})\b', line)
        if match:
            return match.group(1)
    return None


# ── Main ───────────────────────────────────────────────────────────────────

def main() -> None:
    if not BASELINE_FILE.exists():
        print("[ERRO] baseline.txt não encontrado. Abortando.")
        sys.exit(1)

    baseline_backup = BASELINE_FILE.read_text().strip()
    print(f"[INFO] Baseline salvo para rollback: {baseline_backup}")

    scripts = {
        "build":    SCRIPT_DIR / "build_deploy.py",
        "xml":      SCRIPT_DIR / "gerador_package.py",
        "training": SCRIPT_DIR / "deploy_training.py",
        "prd":      SCRIPT_DIR / "validate_prd.py",
    }

    # ── ETAPA 1: Build ─────────────────────────────────────────────────────
    print()
    print("==> [1/4] Executando build...")
    if run_script(scripts["build"]) != 0:
        rollback("build_deploy.py (exit code diferente de 0)", baseline_backup)

    # ── ETAPA 2: Gerar package.xml ─────────────────────────────────────────
    print()
    print("==> [2/4] Gerando package.xml...")
    if run_script(scripts["xml"]) != 0:
        rollback("gerador_package.py (exit code diferente de 0)", baseline_backup)

    # ── ETAPA 3: Training em background ────────────────────────────────────
    print()
    print("==> [3/4] Disparando deploy em Training (paralelo ao PRD)...")

    training_exit_code: list[int] = []

    def run_training() -> None:
        training_exit_code.append(run_script(scripts["training"]))

    training_thread = threading.Thread(target=run_training, daemon=True)
    training_thread.start()
    print("[INFO] Training rodando em background (thread iniciada)")

    # ── ETAPA 4: Validação PRD (síncrono) ──────────────────────────────────
    print()
    print("==> [4/4] Validação em PRD...")
    prd_exit = run_script(scripts["prd"])

    training_thread.join()
    treino_exit = training_exit_code[0] if training_exit_code else -1

    if prd_exit != 0:
        rollback("validate_prd.py (exit code diferente de 0)", baseline_backup)

    if log_has_errors(LOG_PRD):
        print("[ERRO] Erros detectados no deploy_prd_output.log:")
        print_errors_from_log(LOG_PRD)
        rollback("validate PRD (erros encontrados no log)", baseline_backup)

    print("[OK] Validação em PRD concluída sem erros.")

    # ── Resultado do Training (informativo) ────────────────────────────────
    print()
    if treino_exit != 0:
        print(f"[AVISO] Training terminou com exit code {treino_exit} — verifique deploy_training_output.log")
    elif log_has_errors(LOG_TRAINING):
        print("[AVISO] Training concluído mas com erros no log — verifique deploy_training_output.log")
    else:
        print("[OK] Deploy em Training concluído sem erros.")

    # ── Atualiza baseline APÓS PRD passar ──────────────────────────────────
    # build_deploy.py publica o HEAD calculado em NOVO_BASELINE.
    # Se a env var não estiver disponível (subprocesso isolado), faz fallback
    # lendo git rev-parse HEAD diretamente.
    novo_baseline = os.environ.get("NOVO_BASELINE", "").strip()
    if not novo_baseline:
        novo_baseline = subprocess.run(
            ["git", "rev-parse", "HEAD"],
            capture_output=True, text=True, check=True,
        ).stdout.strip()
    BASELINE_FILE.write_text(novo_baseline + "\n")
    print(f"[INFO] baseline.txt atualizado para: {novo_baseline}")

    # ── Job ID para quick deploy ────────────────────────────────────────────
    job_id = extract_job_id(LOG_PRD)

    if job_id:
        JOB_ID_FILE.write_text(job_id + "\n")
        print()
        print("╔══════════════════════════════════════════════════════════════╗")
        print("║  PIPELINE CONCLUÍDO COM SUCESSO                              ║")
        print(f"║  Job ID para quick deploy: {job_id}  ║")
        print("║  Execute pelo time de PRD: python quick_deploy_prd.py        ║")
        print("╚══════════════════════════════════════════════════════════════╝")
    else:
        print()
        print("[AVISO] Job ID não encontrado no log. Verifique deploy_prd_output.log manualmente.")
        print("[INFO]  Pipeline concluído. Baseline atualizado.")

    print()
    print("Fim da execução.")


if __name__ == "__main__":
    main()
