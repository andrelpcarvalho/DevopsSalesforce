#!/bin/bash
# Nome do diretório contendo os metadados
PROJECT_DIR="$(echo "$FULL_PATH" | sed -E 's|(.*workspace_bash).*|\1|')"
project_name="build_deploy"

#Limpa o arquivo de log do deploy
rm deploy_prd_output.log;

# Inicia o arquivo package.xml
echo "Comando de validação em PRD"
sf project deploy validate --source-dir $PROJECT_DIR/$project_name/force-app/main/default --target-org devops -w 240 --verbose > deploy_prd_output.log 2>&1 &
echo "Terminou a chamada do comando de deploy em PRD"
