#!/bin/bash

# Arquivo package.xml de saída
output_file="package.xml"

PROJECT_DIR="$(echo "$FULL_PATH" | sed -E 's|(.*workspace_bash).*|\1|')"
project_name="build_deploy"

BUILD_DIR="${PROJECT_DIR}${project_name}\\"

# Inicia o arquivo package.xml
sf project generate manifest --source-dir $BUILD_DIR
