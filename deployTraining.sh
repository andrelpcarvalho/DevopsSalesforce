#!/bin/bash
# Nome do diretório contendo os metadados
PROJECT_DIR="$(echo "$FULL_PATH" | sed -E 's|(.*workspace_bash).*|\1|')"
project_name="build_deploy"

#Limpa o arquivo de log do deploy
rm deploy_training_output.log;

# Inicia o arquivo package.xml
echo "Comando de deploy em Training"
sf project deploy start --source-dir $PROJECT_DIR/$project_name/force-app/main/default --target-org "treino" --test-level RunLocalTests -w 240 --ignore-conflicts --verbose > deploy_training_output.log 2>&1 &
echo "Terminou a chamada do comando de deploy em Training"
