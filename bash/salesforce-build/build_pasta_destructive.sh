#!/bin/bash
#Como já rodamos o build e a criação do backup essa pasta é só para copiar os arquivos deletados para uma pasta de destructive

#Caminho da pasta do destructive
DESTRUCTIVE_BUILD_DIR="\Users\andre.carvalho\Documents\BANCO_BV_Workspace_TESTES\destructive_build"

#Caminho da pasta backup onde estão os arquivo que serão copiados
LOCAL_DIR="\Users\andre.carvalho\Documents\BANCO_BV_Workspace_TESTES\build_backup"

#Limpa a pasta build se existir e se não existir cria uma nova pasta build
rm -rf $DESTRUCTIVE_BUILD_DIR;
mkdir $DESTRUCTIVE_BUILD_DIR;

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

#Substrings de referência
substring="\303"
substring_experiences="/experiences/"
substring_component_aura="/aura/"
substring_component_lwc="/lwc/"
substring_layout="/layouts/"

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

echo "Pasta do destrutivo criada na pasta $DESTRUCTIVE_BUILD_DIR."