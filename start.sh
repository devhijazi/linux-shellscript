#!/usr/bin/env bash

MENU_OPTIONS="
  1 - INFORMACOES
  2 - ATUALIZAÇÕES APT
  3 - BAIXAR/INSTALAR PYTHON3
  4 - BAIXAR/INSTALAR APPS
  5 - BAIXAR/INSTALAR LIBS
  6 - CORRIGIR BUG COM SOURCELIST
  7 - BAIXAR/INSTALAR PACOTES VIA SNAP
  8 - BAIXAR/INSTALAR NODEJS *
  9 - BAIXAR/INSTALAR/CONFIGURAR VISTUAL STUDIO CODE *
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

3)
  source ./scripts/python.sh
  ;;

4)
  source ./scripts/external-apps.sh
  ;;

5)
  source ./scripts/libs.sh
  ;;

6)
  source ./scripts/fix-sourcelist.sh
  ;;

7)
  source ./scripts/snap-apps.sh
  ;;
8)
  echo "Essa função ainda não está pronta..."
  ;;

9)
  echo "Essa função ainda não está pronta..."
  ;;

\
  *)
  echo "Opção $OPTIONS desconhecida..."
  exit 1
  ;;
esac
