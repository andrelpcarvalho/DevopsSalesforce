#!/bin/bash

# Caminho para o script que você deseja executar
build="\Users\andre.carvalho\Documents\BANCO_BV_Workspace_TESTES\testeBash\bash\salesforce-build\build.sh"
xml="\Users\andre.carvalho\Documents\BANCO_BV_Workspace_TESTES\testeBash\bash\salesforce-build\gerador_package.sh"

# Executar o script usando bash
echo "Executar build"
bash $build

echo "gerar package.xml"
bash $xml

echo "Fim da execução"
