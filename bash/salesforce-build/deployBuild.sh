#!/bin/bash
#UAT export COMMIT_HASH="cf9e952f0b411b1668c345662c04068a3a3494aa"

FULL_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(echo "$FULL_PATH" | sed -E 's|(.*workspace_bash).*|\1|')"
echo "SCRIPT_DIR : $PROJECT_DIR"

project_name="build_deploy"

sf project generate --name $project_name --output-dir $PROJECT_DIR

BUILD_DIR="${PROJECT_DIR}${project_name}\\"

#Caminho da pasta onde estão os arquivos que serão copiados
LOCAL_DIR="$(echo "$FULL_PATH" | sed -E 's|(.*teste_bash).*|\1|')"
echo "LOCAL_DIR : $LOCAL_DIR"

# ── Lê o baseline — se não existir, aborta com exit 1 ──
if [[ -f "$FULL_PATH/baseline.txt" ]]; then
    COMMIT_HASH=$(<"$FULL_PATH/baseline.txt")
else
    echo "[ERRO] Arquivo baseline.txt não encontrado!"
    exit 1
fi

echo "Baseline : $COMMIT_HASH"
branch="release-v4.0.0"

echo "Checkout to $branch"
git checkout $branch
if [[ $? -ne 0 ]]; then
    echo "[ERRO] Falha no git checkout. Abortando."
    exit 1
fi

echo "git fetch"
git fetch
if [[ $? -ne 0 ]]; then
    echo "[ERRO] Falha no git fetch. Abortando."
    exit 1
fi

echo "git pull"
git pull
if [[ $? -ne 0 ]]; then
    echo "[ERRO] Falha no git pull. Abortando."
    exit 1
fi

# Gera lista de commits desde o baseline
rm -f commitlist.txt
git rev-list $COMMIT_HASH..HEAD --oneline > commitlist.txt

# Limpa e recria a pasta build
rm -rf $BUILD_DIR
mkdir $BUILD_DIR

if [ -z "$COMMIT_HASH" ] || [ -z "$BUILD_DIR" ]; then
    echo "[ERRO] COMMIT_HASH ou BUILD_DIR não definidos."
    exit 1
fi

# ── Caracteres especiais ──
declare -A specialchars=(
    ["\\303\\247"]="ç"
    ["\\303\\272"]="ú"
    ["\\303\\243"]="ã"
    ["\\303\\255"]="í"
    ["\\303\\241"]="á"
    ["\\303\\264"]="ô"
    ["\\303\\263"]="ó"
    ["\\303\\251"]="é"
    ["\\303\\265"]="õ"
)

replace_special_chars() {
    local filename="$1"
    for special in "${!specialchars[@]}"; do
        filename=$(echo "$filename" | sed 's/\\303\\247/ç/g')
        filename=$(echo "$filename" | sed 's/\\303\\272/ú/g')
        filename=$(echo "$filename" | sed 's/\\303\\243/ã/g')
        filename=$(echo "$filename" | sed 's/\\303\\255/í/g')
        filename=$(echo "$filename" | sed 's/\\303\\241/á/g')
        filename=$(echo "$filename" | sed 's/\\303\\264/ô/g')
        filename=$(echo "$filename" | sed 's/\\303\\263/ó/g')
        filename=$(echo "$filename" | sed 's/\\303\\251/é/g')
        filename=$(echo "$filename" | sed 's/\\303\\265/õ/g')
    done
    echo "$filename"
}

clean_file() {
    local file="$1"
    local cleaned_file
    cleaned_file=$(replace_special_chars "$file")
    cleaned_file=${cleaned_file#\"}
    cleaned_file=${cleaned_file%\"}
    echo "$cleaned_file"
}

copy_class_meta() {
    local cleaned_file="$1"
    local BUILD_DIR="$2"
    mkdir -p "$BUILD_DIR/$(dirname "$cleaned_file")"
    local meta_file="${cleaned_file}-meta.xml"
    cp "$LOCAL_DIR/$meta_file" "$BUILD_DIR/$meta_file"
    cp "$LOCAL_DIR/$cleaned_file" "$BUILD_DIR/$cleaned_file"
}

copy_extension_file_path() {
    local file="$1"
    local BUILD_DIR="$2"
    local diretorioFile
    diretorioFile=$(dirname "$file")
    local upFile
    upFile=$(dirname "$diretorioFile")
    mkdir -p "$BUILD_DIR/$upFile"
    local destino
    destino=$(dirname "$upFile")
    local nome_pasta
    nome_pasta=$(basename "$upFile")
    local meta_file="${nome_pasta}.site-meta.xml"
    cp -r "$LOCAL_DIR/$upFile" "$BUILD_DIR/$destino"
    cp -r "$LOCAL_DIR/$destino/$meta_file" "$BUILD_DIR/$destino/$meta_file"
}

copy_components_path() {
    local file="$1"
    local BUILD_DIR="$2"
    local diretorioFile
    diretorioFile=$(dirname "$file")
    local upFile
    upFile=$(dirname "$diretorioFile")
    mkdir -p "$BUILD_DIR/$upFile"
    cp -r "$LOCAL_DIR/$diretorioFile" "$BUILD_DIR/$upFile"
}

# ── Gera listas de arquivos por status ──
rm -f arquivos_modificados.txt lista_arquivos_naodeletados.txt
rm -f lista_arquivos_adicionados.txt lista_arquivos_modificados.txt lista_arquivos_deletados.txt

git diff-tree --name-only --no-commit-id -r $COMMIT_HASH HEAD > arquivos_modificados.txt

git diff --name-status $COMMIT_HASH HEAD | grep '^[^D]' | cut -f2- > lista_arquivos_naodeletados.txt
git diff --name-status $COMMIT_HASH HEAD | grep '^D'    | cut -f2- > lista_arquivos_deletados.txt
git diff --name-status $COMMIT_HASH HEAD | grep '^A'    | cut -f2- > lista_arquivos_adicionados.txt
git diff --name-status $COMMIT_HASH HEAD | grep '^M'    | cut -f2- > lista_arquivos_modificados.txt

substring="\\303"
substring_experiences="/experiences/"
substring_component_aura="/aura/"
substring_component_lwc="/lwc/"

echo "Arquivos Modificados ou adicionados"
while IFS= read -r file; do
    rm -f arquivos_com_aspas.txt
    echo "\"$file\"" >> arquivos_com_aspas.txt
    cleaned_file=$file
    echo "Arquivo a ser avaliado : $cleaned_file"
    if [[ "$file" == *"$substring"* ]]; then
        cleaned_file=$(clean_file "$file")
    fi

    if [[ $cleaned_file == *.cls || $cleaned_file == *.trigger ]]; then
        copy_class_meta "$cleaned_file" "$BUILD_DIR"
    elif [[ $cleaned_file == *"$substring_component_aura"* || $cleaned_file == *"$substring_component_lwc"* ]]; then
        copy_components_path "$cleaned_file" "$BUILD_DIR"
    elif [[ "$cleaned_file" == *"$substring_experiences"* ]]; then
        copy_extension_file_path "$cleaned_file" "$BUILD_DIR"
    else
        mkdir -p "$BUILD_DIR/$(dirname "$cleaned_file")"
        cp "$LOCAL_DIR/$cleaned_file" "$BUILD_DIR/$cleaned_file"
    fi

    rm -f modified_files_without_special_chars.txt
    echo "$cleaned_file" >> modified_files_without_special_chars.txt

done < lista_arquivos_naodeletados.txt

# ── Captura o novo hash mas NÃO grava ainda no baseline.txt ──
# A gravação é responsabilidade do deploy.sh, somente após validate PRD passar.
NOVO_BASELINE=$(git rev-parse HEAD)
echo "[INFO] Novo baseline calculado: $NOVO_BASELINE"
echo "[INFO] baseline.txt será atualizado pelo deploy.sh após validate PRD."

# Exporta para que deploy.sh possa gravar ao final
export NOVO_BASELINE

commit_branch=$(git branch)
echo -e "commit branch\n\n$commit_branch"
echo "Build project criado em $BUILD_DIR."
