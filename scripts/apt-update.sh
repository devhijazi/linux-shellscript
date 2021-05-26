#!/usr/bin/env bash

echo "Removendo eventuais travas da atualização"
sudo rm /var/lib/dpkg/lock-frontend;
sudo rm /var/cache/apt/archives/lock;

# Verifica atualizações do APT e instala
clear
echo "Verificando se há atualizações..."
sudo apt update;

clear
echo "Baixando e instalando atualizações..."
sudo apt-get upgrade;

clear
echo "Baixando atualizações..."
sudo apt dist-upgrade -y;

clear
echo "Limpando..."
sudo apt autoclean;
sudo apt autoremove -y;

clear
echo "Operação finalizada com sucesso"
