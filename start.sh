#!/usr/bin/env bash

MENU_OPTIONS="
  1 - INFORMACOES
  2 - ATUALIZAÇÕES APT
"
echo "$MENU_OPTIONS"

read -p " ESCOLHA UMA OPÇÃO PARA CONTINUAR: " OPTIONS

case $OPTIONS in
1)
  source ./scripts/info.sh
  ;;

2)
  source ./scripts/apt-update.sh
  ;;

\
  *)
  echo "Opção $OPTIONS desconhecida..."
  exit 1
  ;;
esac
