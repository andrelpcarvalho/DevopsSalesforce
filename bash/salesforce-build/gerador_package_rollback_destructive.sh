#!/bin/bash
# Nome do diretório contendo os metadados
metadata_dir="\Users\andre.carvalho\Documents\BANCO_BV_Workspace_TESTES\rollback_destructive\force-app\\"

# Arquivo package.xml de saída
output_file="package-rollback-post.xml"

# Inicia o arquivo package.xml
sf project generate manifest --source-dir $metadata_dir --name $output_file
