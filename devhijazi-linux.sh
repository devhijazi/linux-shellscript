#!/usr/bin/env bash

# ----------------------------- CREATED BY ----------------------------- #

system="`lsb_release -sd`"
architecture="`uname -m`"
environment="`gnome-shell --version`"

echo "LINUX POS INSTALL SCRIPT "
echo "Author: Gabriel Hijazi"
echo "System: $system"
echo "Architecture: $architecture"
echo "Environment: $environment"
echo "Home: $HOME"
echo "User: $USER"
sudo echo -n ""

# ----------------------------- VARIAVEIS CONSTANTES ----------------------------- #
PPA_GRAPHICS_DRIVERS="ppa:graphics-drivers/ppa"


URL_GOOGLE_CHROME= "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
URL_WINE_KEY= "https://dl.winehq.org/wine-builds/winehq.key"
URL_SIMPLE_NOTE= "https://github.com/Automattic/simplenote-electron/releases/download/v1.8.0/Simplenote-linux-1.8.0-amd64.deb"

# URL_VISUAL_STUDIO_CODE="https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64"

# DIRETÓRIO PARA DOWNLOAD 
DOWNLOAD_DIR= "$HOME/Downloads/Programas"

# PROGRAMAS PARA INSTALAR
PROGRAMS_INSTALL_LIST =(
  snapd
  libsqlite3-0:i386
)


#REMOVENDO TRAVAS EVENTUAIS NA ATUALIZAÇÃO APT
sudo rm /var/lib/dpkg/lock-frontend;
sudo rm /var/cache/apt/archives/lock;


# ----------------------------- EXECUÇÃO ----------------------------- #

# ATUALIZANDO REPOSITORIOS DO SISTEMA 
sudo apt update -y


# ADICIONANDO REPOSITORIOS DE TERCEIROS E ATUALIZANDO DRIVERS
sudo apt-add-repository "$PPA_GRAPHICS_DRIVERS" -y
wget -nc "$URL_WINE_KEY"
sudo apt-key add winehq.key
sudo apt-add-repository "deb $URL_PPA_WINE bionic main"

# INSTALANDO PACOTES .DEB BAIXADOS NO SCRIPT ANTERIOR
sudo dpkg -i $DOWNLOAD_DIR/*.deb

# INSTALANDO PACOTES .DEB DO UBUNTU
sudo apt install python3 python-pip docker docker-compose git -y &&

# ----------------------------- NODEJS ----------------------------- #
printLine "Node"

NODE_CHANNEL="14/stable"

echo "Instalando e configurando o NODEJS via SNAP, por favor aguarde..."
sudo snap install node --channel=$NODE_CHANNEL --classic

if [[ "`snap list node`" != *" $NODE_CHANNEL "* ]]
then
  sudo snap switch node --channel=$NODE_CHANNEL
  sudo snap refresh node
fi

#----------------------------- VISUAL STUDIO CODE-----------------------------#

printLine "Visual Studio Code"

echo "Instalando e configurando o Visual Studio via SNAP, por favor aguarde..."
sudo snap install code --classic

VSC_EXTENTIONS=( \
  "mads-hartmann.bash-ide-vscode" \
  "coenraads.bracket-pair-colorizer" \
  "naumovs.color-highlight" \
  "kamikillerto.vscode-colorize" \
  "icrawl.discord-vscode" \
  "mikestead.dotenv" \
  "dbaeumer.vscode-eslint" \
  "ms-toolsai.jupyter" \
  "ms-vsliveshare.vsliveshare" \
  "yzhang.markdown-all-in-one" \
  "shd101wyy.markdown-preview-enhanced" \
  "pkief.material-icon-theme" \
  "silvenon.mdx" \
  "s3gf4ult.monokai-vibrant" \
  "bmewburn.vscode-intelephense-client" \
  "esbenp.prettier-vscode" \
  "ms-python.vscode-pylance" \
  "ms-python.python" \
  "TabNine.tabnine-vscode" \
  "visualstudioexptteam.vscodeintellicode" \
  "jpoissonnier.vscode-styled-components" \
)
i=0
while [ $i != ${#VSC_EXTENTIONS[@]} ]
do
  snap run code --install-extension "${VSC_EXTENTIONS[$i]}"
  
  let "i++"
done

file="$HOME/.config/Code/User/settings.json"
json="`cat "$file"`"
if [ -z "$json" ]
then
  json="{}"
fi
json="`echo "$json" | jq '."workbench.startupEditor"="newUntitledFile"'`"
json="`echo "$json" | jq '."workbench.iconTheme"="material-icon-theme"'`"
json="`echo "$json" | jq '."extensions.ignoreRecommendations"=true'`"
json="`echo "$json" | jq '."window.zoomLevel"none'`"
json="`echo "$json" | jq '."editor.minimap.enabled"=false'`"
json="`echo "$json" | jq '."editor.suggestSelection"="first"'`"
json="`echo "$json" | jq '."editor.tabSize"="2"'`"
json="`echo "$json" | jq '."editor.renderLineHighlight"="gutter"'`"
json="`echo "$json" | jq '."editor.fontLigatures"="true"'`"
json="`echo "$json" | jq '."editor.detectIndentation"="false"'`"
json="`echo "$json" | jq '."editor.codeActionsOnSave"="source.fixAll:"true"'`"
json="`echo "$json" | jq '."editor.fontFamily"="Fira Code, Source Code Pro, monospace "'`"
json="`echo "$json" | jq '."git.suggestSmartCommit"=true'`"
json="`echo "$json" | jq '."git.confirmSync"=false'`"
json="`echo "$json" | jq '."git.fetchOnPull"=false'`"
json="`echo "$json" | jq '."git.autofetch"=true'`"
echo "$json" > "$file"

echo "Visual Studio Code está pronto."


# INSTALANDO PROGRAMAS NA APT
for program_name in ${PROGRAMS_INSTALL_LIST[@]}; do
  if ! dpkg -l | grep -q $program_name; then
    apt install "$program_name" -y
  else
    echo "[INSTALADO] - $program_name"
  fi
done

sudo apt install --install-recommends winehq-stable wine-stable wine-stable-i386 wine-stable-amd64 -y;

# ----------------------------- PÓS-INSTALAÇÃO ----------------------------- #

# FINALIZAÇÃO, LIMPEZA E ATUALIZAÇÃO
sudo apt update && sudo apt dist-upgrade -y;
sudo apt autoclean;
sudo apt autoremove -y;

echo "Finalizado"