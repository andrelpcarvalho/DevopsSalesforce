#!/bin/bash
#UAT export COMMIT_HASH="cf9e952f0b411b1668c345662c04068a3a3494aa"

#Caminho da pasta build
BUILD_DIR="\Users\andre.carvalho\Documents\BANCO_BV_Workspace_TESTES\build"

DESTRUCTIVE_BUILD_DIR="\Users\andre.carvalho\Documents\BANCO_BV_Workspace_TESTES\destructive_build"
#Caminho da pasta onde estão os arquivo que serão copiados
LOCAL_DIR="\Users\andre.carvalho\Documents\BANCO_BV_Workspace_TESTES\testeBash"

: << 'EOF'
#Commmit baseline USAR pra Release esse trecho
COMMIT_HASH=$(<\\Users\\andre.carvalho\\Documents\\BANCO_BV_Workspace_TESTES\\testeBash\\bash\\salesforce-build\\baseline.txt)
echo "Baseline : $COMMIT_HASH"
branch="release-v3.0.0"
EOF

#Branch de referência e atualização local
branch="backupUat"
export COMMIT_HASH="9e1cad64c8c105d2dd15f15eeb3ed1c9b185a119"


#Selecionando a branch pra fazer o diff
echo "Checkout to $branch"
git checkout $branch; # <HEAD>

#Trecho para criação das tags
: << 'EOF'
# Obtém a última tag
LAST_TAG=$(git describe --tags $(git rev-list --tags --max-count=1))

# Se não houver tags, começa com v1.0.0
if [ -z "$LAST_TAG" ]; then
  NEW_TAG="v1.0.0"
else
  # Incrementa a versão
  IFS='.' read -r -a VERSION_PARTS <<< "${LAST_TAG//v/}"
  MAJOR=${VERSION_PARTS[0]}
  MINOR=${VERSION_PARTS[1]}
  PATCH=${VERSION_PARTS[2]}
  PATCH=$((PATCH + 1))
  NEW_TAG="v$MAJOR.$MINOR.$PATCH"
fi

git tag -a "$NEW_TAG" -m "New tag: $NEW_TAG" $COMMIT_HASH
EOF

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

rm -rf $DESTRUCTIVE_BUILD_DIR;
mkdir $DESTRUCTIVE_BUILD_DIR;

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

: << 'EOF'
while IFS= read -r file; do 

    if [[ $file == *"$substring_layout"* ]]; then
        echo "arquivo cru sem aspas $file"
    fi
done < arquivos_modificados.txt
EOF

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
    
    if [[ $cleaned_file == *.cls ]]; then
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

: << 'EOF'
echo "Arquivos Deletados"
while IFS= read -r file; do
        
    rm arquivos_com_aspas.txt;
    echo "\"$file\"" >> arquivos_com_aspas.txt
    cleaned_file=$file
    echo "Arquivo deletado a ser avaliado : $cleaned_file"
    if [[ "$file" == *"$substring"* ]]; then
        cleaned_file=$(clean_file "$file" ) 
    fi    
    
    if [[ $cleaned_file == *.cls ]]; then
        copy_class_meta "$cleaned_file" "$DESTRUCTIVE_BUILD_DIR"
    elif [[ $cleaned_file == *"$substring_component_aura"* ||  $cleaned_file == *"$substring_component_lwc"* ]]; then
        copy_components_path "$cleaned_file" "$DESTRUCTIVE_BUILD_DIR"
    elif [[ "$cleaned_file" == *"$substring_experiences"* ]]; then
        copy_extension_file_path "$cleaned_file" "$DESTRUCTIVE_BUILD_DIR"
    else
        # Cria o diretório se não existir
        mkdir -p "$DESTRUCTIVE_BUILD_DIR/$(dirname "$cleaned_file")"
        echo "Vai copiar daqui $LOCAL_DIR/$cleaned_file "
        echo "Para esse lugar $DESTRUCTIVE_BUILD_DIR/$cleaned_file"
        # Copia o arquivo da pasta local para a pasta de build
        cp "$LOCAL_DIR/$cleaned_file" "$DESTRUCTIVE_BUILD_DIR/$cleaned_file"
    fi
    # Adiciona o nome do arquivo ao arquivo de lista
    rm modified_files_without_special_chars.txt;
    echo "$cleaned_file" >> modified_files_without_special_chars.txt

done < lista_arquivos_deletados.txt
EOF

#Branch e hash do head
hash_commit=$(git rev-parse HEAD)
echo "hash da head $hash_commit"

rm baseline.txt;
echo "$hash_commit" >> baseline.txt

commit_branch=$(git branch)
echo "commit branch $commit_branch"

echo "Build project criado em $BUILD_DIR."