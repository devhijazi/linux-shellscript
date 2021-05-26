#!/usr/bin/env bash

#-------------------------CONSTANTES------------------------#

URL_GOOGLE_CHROME="https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
URL_SIMPLE_NOTE="https://github.com/Automattic/simplenote-electron/releases/download/v1.8.0/Simplenote-linux-1.8.0-amd64.deb"
URL_VISUAL_STUDIO_CODE="https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64"

#-------------------------CONSTANTES------------------------#

# CRIANDO PASTA DESTINO PARA DOWNLOAD
DOWNLOAD_FOLDER="$HOME/Downloads/Programas"

echo "Baixando o Google Chrome"
wget -nc "$URL_GOOGLE_CHROME";
clear

echo "Baixando o Simple Note"
wget -nc "$URL_SIMPLE_NOTE";
clear

echo "Baixando o Visual Studio Code"
wget -nc "$URL_VISUAL_STUDIO_CODE";
clear

echo "Tentando instalar pacotes..."
sudo dpkg -i $DOWNLOAD_DIR/*.deb