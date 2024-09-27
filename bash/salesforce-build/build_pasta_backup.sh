# Diretório do repositório clonado
repo_dir="\Users\andre.carvalho\Documents\BANCO_BV_Workspace_TESTES\testeBash"

# Nome da branch que você quer baixar
branch_name="backupUat"

# Nome da tag que você quer baixar
tag_name="v1.0.0"

# Diretório onde você quer salvar a tag
target_dir="\Users\andre.carvalho\Documents\BANCO_BV_Workspace_TESTES\build_backup"

rm -rf $target_dir;
mkdir $target_dir;

# Navega até o diretório do repositório
cd $repo_dir

# Faz o fetch
git fetch

# Faz o checkout da branch específica
git checkout $branch_name

# Faz o fetch da tag específica
git fetch origin tag $tag_name

# Faz o checkout da tag específica
git checkout tags/$tag_name

# Copia o conteúdo da tag para o diretório alvo
cp -r * $target_dir

echo "Tag $tag_name da branch $branch_name foi baixada para $target_dir"