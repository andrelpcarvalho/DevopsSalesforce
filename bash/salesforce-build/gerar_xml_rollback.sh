#!/bin/bash

# Caminho para o script que você deseja executar
package_rollback="\Users\andre.carvalho\Documents\BANCO_BV_Workspace_TESTES\testeBash\bash\salesforce-build\gerador_package_rollback.sh"
package_rollback_destructive="\Users\andre.carvalho\Documents\BANCO_BV_Workspace_TESTES\testeBash\bash\salesforce-build\gerador_package_rollback_destructive.sh"

echo "gerar package_rollback.xml"
bash $package_rollback

: << 'EOF'
echo "gerar package_rollback_destructive.xml"
bash $package_rollback_destructive
EOF

echo "Fim da execução"
