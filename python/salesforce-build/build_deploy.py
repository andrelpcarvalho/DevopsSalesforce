#!/usr/bin/env python3
"""
build_deploy.py
Etapa 1: build e cópia de arquivos modificados desde o baseline.
"""

import os
import re
import shutil
import subprocess
import sys
from pathlib import Path

from config import BASELINE_FILE, BRANCH, BUILD_DIR, PROJECT_DIR, PROJECT_NAME, SCRIPT_DIR , LOCAL_DIR


# ── Caracteres especiais (octal → Unicode) ─────────────────────────────────

SPECIAL_CHARS = {
    r"\\303\\247": "ç",
    r"\\303\\272": "ú",
    r"\\303\\243": "ã",
    r"\\303\\255": "í",
    r"\\303\\241": "á",
    r"\\303\\264": "ô",
    r"\\303\\263": "ó",
    r"\\303\\251": "é",
    r"\\303\\265": "õ",
}


# ── Utilitários ────────────────────────────────────────────────────────────

def run(cmd: list[str]) -> None:
    """Executa um comando shell e aborta em caso de erro."""
    print(f"$ {' '.join(cmd)}")
    result = subprocess.run(cmd)
    if result.returncode != 0:
        print(f"[ERRO] Falha ao executar: {' '.join(cmd)}")
        sys.exit(1)


def replace_special_chars(filename: str) -> str:
    for escaped, char in SPECIAL_CHARS.items():
        filename = re.sub(escaped, char, filename)
    return filename


def clean_filename(filename: str) -> str:
    filename = replace_special_chars(filename)
    filename = filename.strip('"')
    return filename


# ── Funções de cópia ───────────────────────────────────────────────────────

def copy_class_meta(cleaned_file: str, build_dir: Path) -> None:
    src = LOCAL_DIR / cleaned_file
    dst = build_dir / cleaned_file
    dst.parent.mkdir(parents=True, exist_ok=True)
    shutil.copy2(src, dst)
    meta = cleaned_file + "-meta.xml"
    shutil.copy2(LOCAL_DIR / meta, build_dir / meta)


def copy_extension_file_path(file: str, build_dir: Path) -> None:
    p       = Path(file)
    up_file = p.parent.parent
    destino = up_file.parent
    (build_dir / destino).mkdir(parents=True, exist_ok=True)
    shutil.copytree(LOCAL_DIR / up_file, build_dir / up_file, dirs_exist_ok=True)
    meta = f"{up_file.name}.site-meta.xml"
    meta_src = LOCAL_DIR / destino / meta
    if meta_src.exists():
        shutil.copy2(meta_src, build_dir / destino / meta)


def copy_components_path(file: str, build_dir: Path) -> None:
    p        = Path(file)
    dir_file = p.parent
    up_file  = dir_file.parent
    (build_dir / up_file).mkdir(parents=True, exist_ok=True)
    shutil.copytree(LOCAL_DIR / dir_file, build_dir / dir_file, dirs_exist_ok=True)


def copy_file(file: str, build_dir: Path) -> None:
    cleaned = clean_filename(file)
    if cleaned.endswith((".cls", ".trigger")):
        copy_class_meta(cleaned, build_dir)
    elif "/aura/" in cleaned or "/lwc/" in cleaned:
        copy_components_path(cleaned, build_dir)
    elif "/experiences/" in cleaned:
        copy_extension_file_path(cleaned, build_dir)
    else:
        src = LOCAL_DIR / cleaned
        dst = build_dir / cleaned
        dst.parent.mkdir(parents=True, exist_ok=True)
        shutil.copy2(src, dst)


# ── Git ────────────────────────────────────────────────────────────────────

def git_diff_files(commit_hash: str) -> dict[str, list[str]]:
    result = subprocess.run(
        ["git", "diff", "--name-status", commit_hash, "HEAD"],
        capture_output=True, text=True, check=True,
    )
    added, modified, deleted, not_deleted = [], [], [], []
    for line in result.stdout.splitlines():
        if not line.strip():
            continue
        status, *parts = line.split("\t")
        filepath = parts[-1]
        if status.startswith("D"):
            deleted.append(filepath)
        else:
            not_deleted.append(filepath)
            if status.startswith("A"):
                added.append(filepath)
            elif status.startswith("M"):
                modified.append(filepath)
    return {"added": added, "modified": modified, "deleted": deleted, "not_deleted": not_deleted}


# ── Main ───────────────────────────────────────────────────────────────────

def main() -> None:
    print(f"SCRIPT_DIR  : {SCRIPT_DIR}")
    print(f"PROJECT_DIR : {PROJECT_DIR}")

    run(["sf", "project", "generate", "--name", PROJECT_NAME, "--output-dir", str(PROJECT_DIR)])

    if not BASELINE_FILE.exists():
        print("[ERRO] baseline.txt não encontrado!")
        sys.exit(1)

    commit_hash = BASELINE_FILE.read_text().strip()
    print(f"Baseline : {commit_hash}")

    run(["git", "checkout", BRANCH])
    run(["git", "fetch"])
    run(["git", "pull"])

    commits = subprocess.run(
        ["git", "rev-list", f"{commit_hash}..HEAD", "--oneline"],
        capture_output=True, text=True, check=True,
    ).stdout
    Path("commitlist.txt").write_text(commits)

    if BUILD_DIR.exists():
        shutil.rmtree(BUILD_DIR)
    BUILD_DIR.mkdir(parents=True)

    diff = git_diff_files(commit_hash)

    Path("lista_arquivos_naodeletados.txt").write_text("\n".join(diff["not_deleted"]))
    Path("lista_arquivos_deletados.txt").write_text("\n".join(diff["deleted"]))
    Path("lista_arquivos_adicionados.txt").write_text("\n".join(diff["added"]))
    Path("lista_arquivos_modificados.txt").write_text("\n".join(diff["modified"]))

    print("Arquivos modificados ou adicionados:")
    for file in diff["not_deleted"]:
        print(f"  Arquivo a ser avaliado: {file}")
        try:
            copy_file(file, BUILD_DIR)
        except FileNotFoundError as e:
            print(f"  [AVISO] Arquivo não encontrado: {e}")
        except Exception as e:
            print(f"  [AVISO] Erro ao copiar '{file}': {e}")

    novo_baseline = subprocess.run(
        ["git", "rev-parse", "HEAD"], capture_output=True, text=True, check=True,
    ).stdout.strip()

    print(f"[INFO] Novo baseline calculado: {novo_baseline}")
    print("[INFO] baseline.txt será atualizado pelo pipeline.py após validate PRD.")

    os.environ["NOVO_BASELINE"] = novo_baseline

    branch_info = subprocess.run(["git", "branch"], capture_output=True, text=True, check=True).stdout
    print(f"commit branch\n\n{branch_info}")
    print(f"Build project criado em {BUILD_DIR}.")


if __name__ == "__main__":
    main()
