#!/bin/bash
# Nome do diretório contendo os metadados
metadata_dir="\Users\andre.carvalho\Documents\BANCO_BV_Workspace_TESTES\rollback\force-app\\"

# Arquivo package.xml de saída
output_file="package-rollback.xml"

# Inicia o arquivo package.xml
sf project generate manifest --source-dir $metadata_dir --name $output_file 
