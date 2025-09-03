#!/bin/bash
#UAT export COMMIT_HASH="cf9e952f0b411b1668c345662c04068a3a3494aa"

#Caminho da pasta build
#BUILD_DIR="\Users\andre.carvalho\Documents\BANCO_BV_Workspace_TESTES\build"
FULL_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(echo "$FULL_PATH" | sed -E 's|(.*workspace_bash).*|\1|')"
echo "SCRIPT_DIR : $PROJECT_DIR"

project_name="build_deploy"

sf project generate --name $project_name --output-dir $PROJECT_DIR

BUILD_DIR="${PROJECT_DIR}${project_name}\\"

#Caminho da pasta onde estão os arquivo que serão copiados
LOCAL_DIR="$(echo "$FULL_PATH" | sed -E 's|(.*teste_bash).*|\1|')"
echo "LOCAL_DIR : $LOCAL_DIR"

#Commmit baseline USAR pra Release esse trecho
if [[ -f "$FULL_PATH/baseline.txt" ]]; then
    COMMIT_HASH=$(<"$FULL_PATH/baseline.txt")
else
    echo "Arquivo baseline.txt não encontrado!"
    exit 1
fi

#COMMIT_HASH=$(<\\Users\\andre.carvalho\\Documents\\workspace_bash\\teste_bash\\bash\\salesforce-build\\baseline.txt)
echo "Baseline : $COMMIT_HASH"
branch="release-v4.0.0"

#Selecionando a branch pra fazer o diff
echo "Checkout to $branch"
git checkout $branch; # <HEAD>

#Atualizando as branchs com fetch
echo "git fetch"
git fetch

#Baixando os novos commits
echo "git pull"
git pull

#Limpa o arquivo da lista de commits
rm commitlist.txt;
#Gera a lista de commits
git rev-list $COMMIT_HASH..HEAD --oneline > commitlist.txt;

#Limpa a pasta build se existir e se não existir cria uma nova pasta build
rm -rf $BUILD_DIR;
mkdir $BUILD_DIR;

# Verifica se as variáveis COMMIT_HASH e BUILD_DIR estão definidas
if [ -z "$COMMIT_HASH" ] || [ -z "$BUILD_DIR" ]; then
    echo "As variáveis COMMIT_HASH e BUILD_DIR precisam estar definidas. Por favor, defina-as antes de executar o script."
    exit 1
fi


# Define a lista de caracteres especiais e suas substituições
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

# Função para substituir caracteres especiais
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

#Função para limpar o arquivo de caracteres especiais
clean_file (){
    local file="$1"
    
    cleaned_file=$(replace_special_chars "$file")   
    # Remover aspas
    cleaned_file=${cleaned_file#\"}
    cleaned_file=${cleaned_file%\"}

    echo "$cleaned_file"
}

#Função que copia os arquivos de classe
copy_class_meta (){
    local cleaned_file="$1"
    local BUILD_DIR="$2"

    mkdir -p "$BUILD_DIR/$(dirname "$cleaned_file")"
    
    meta_file="${cleaned_file}-meta.xml"
    
    cp "$LOCAL_DIR/$meta_file" "$BUILD_DIR/$meta_file"
    cp "$LOCAL_DIR/$cleaned_file" "$BUILD_DIR/$cleaned_file"
}

#Função que copia a pasta do experiences
copy_extension_file_path (){
    local file="$1"
    local BUILD_DIR="$2"
    # Extrair o diretório do arquivo
    diretorioFile=$(dirname "$file")
    # Subir um nível no diretório
    upFile=$(dirname "$diretorioFile")
    # Criar o diretório de destino, se não existir
    mkdir -p "$BUILD_DIR/$upFile"
    
    # Definir o destino e o nome da pasta
    destino=$(dirname "$upFile")
    nome_pasta=$(basename "$upFile")
    meta_file="${nome_pasta}.site-meta.xml"
    
    # Copiar a pasta e o arquivo meta
    cp -r "$LOCAL_DIR/$upFile" "$BUILD_DIR/$destino"
    cp -r "$LOCAL_DIR/$destino/$meta_file" "$BUILD_DIR/$destino/$meta_file"
}

#Copia a pasta caso seja aura ou lwc
copy_components_path (){
    local file="$1"
    local BUILD_DIR="$2"
    # Extrair o diretório do arquivo
    diretorioFile=$(dirname "$file")
    # Subir um nível no diretório
    upFile=$(dirname "$diretorioFile")

    # Criar o diretório de destino, se não existir
    mkdir -p "$BUILD_DIR/$upFile"      

    # Copiar a pasta e os arquivos
    cp -r "$LOCAL_DIR/$diretorioFile" "$BUILD_DIR/$upFile"
}

# Gerar lista de arquivos modificados entre o commit e o HEAD
rm arquivos_modificados.txt;
git diff-tree --name-only --no-commit-id -r $COMMIT_HASH HEAD > arquivos_modificados.txt

#Substrings de referência
substring="\303"
substring_experiences="/experiences/"
substring_component_aura="/aura/"
substring_component_lwc="/lwc/"
substring_layout="/layouts/"

rm lista_arquivos_naodeletados.txt
rm lista_arquivos_adicionados.txt
rm lista_arquivos_modificados.txt
rm lista_arquivos_deletados.txt

#git diff --name-status $COMMIT_HASH HEAD | grep '^[^D]' | awk '{print $2}' > lista_arquivos_naodeletados.txt
#git diff --name-status -z $COMMIT_HASH HEAD | grep -z '^[^D]' | awk -v RS='\0' '{print $2}' > lista_arquivos_naodeletados.txt
git diff --name-status $COMMIT_HASH HEAD | grep '^[^D]' | cut -f2- > lista_arquivos_naodeletados.txt

git diff --name-status $COMMIT_HASH HEAD | grep '^D' | cut -f2- > lista_arquivos_deletados.txt

git diff --name-status $COMMIT_HASH HEAD | grep '^A' | cut -f2- > lista_arquivos_adicionados.txt

git diff --name-status $COMMIT_HASH HEAD | grep '^M' | cut -f2- > lista_arquivos_modificados.txt


echo "Arquivos Modificados ou adicionados"
#: << 'EOF'
#Intera sobre os arquivos dos commits
while IFS= read -r file; do
        
    rm arquivos_com_aspas.txt;
    echo "\"$file\"" >> arquivos_com_aspas.txt
    cleaned_file=$file
    echo "Arquivo a ser avaliado : $cleaned_file"
    if [[ "$file" == *"$substring"* ]]; then
        cleaned_file=$(clean_file "$file" ) 
    fi    
    
    if [[ $cleaned_file == *.cls || $cleaned_file == *.trigger ]]; then
        copy_class_meta "$cleaned_file" "$BUILD_DIR"
    elif [[ $cleaned_file == *"$substring_component_aura"* ||  $cleaned_file == *"$substring_component_lwc"* ]]; then
        copy_components_path "$cleaned_file" "$BUILD_DIR"
    elif [[ "$cleaned_file" == *"$substring_experiences"* ]]; then
        copy_extension_file_path "$cleaned_file" "$BUILD_DIR"
    else
        # Cria o diretório se não existir
        mkdir -p "$BUILD_DIR/$(dirname "$cleaned_file")"
        
        # Copia o arquivo da pasta local para a pasta de build
        cp "$LOCAL_DIR/$cleaned_file" "$BUILD_DIR/$cleaned_file"
    fi
    # Adiciona o nome do arquivo ao arquivo de lista
    rm modified_files_without_special_chars.txt;
    echo "$cleaned_file" >> modified_files_without_special_chars.txt

done < lista_arquivos_naodeletados.txt
#EOF

#Branch e hash do head
hash_atual_commit=$(git rev-parse HEAD)
echo "hash atual da head : $hash_atual_commit"

rm baseline.txt;
echo "$hash_atual_commit" >> baseline.txt

commit_branch=$(git branch)
echo -e "commit branch\n\n$commit_branch"

echo "Build project criado em $BUILD_DIR."
