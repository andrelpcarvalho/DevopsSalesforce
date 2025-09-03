#!/bin/bash
FULL_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Caminho para o script que você deseja executar
build="$FULL_PATH/deployBuild.sh"
xml="$FULL_PATH/geradorPackage.sh"
treino="$FULL_PATH/deployTraining.sh"
producao="$FULL_PATH/deployPrd.sh"

# Executar o script usando bash
echo "Executar build"
bash $build

echo "gerar package.xml"
bash $xml

echo "Deploy em training"
bash $treino

echo "Terminou deploy em training"

echo "Validação em PRD"
bash $producao
echo "Terminou validação em PRD"

echo "Fim da execução"
