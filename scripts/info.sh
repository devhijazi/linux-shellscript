#!/usr/bin/env bash

clear

system="$(lsb_release -sd)"
architecture="$(uname -m)"
environment="$(gnome-shell --version)"

LIST_INFO="
  - Sistema: $system
  - Arquitetura: $architecture
  - Environment: $environment
  - Home: $HOME
  - User: $USER
"
echo "#--------------------INFORMAÇÕES DO SISTEMA--------------------#"
echo "$LIST_INFO"
echo "#--------------------------------------------------------------#"