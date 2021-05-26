#!/usr/bin/env bash

echo "Corrigindo bug de Source list Malformada"
sudo dpkg --configure -a;
clear

echo "Verificando APT-GET"
sudo apt-get update;
clear

echo "Atualizando APT-GET"
sudo apt-get dist-upgrade;
clear

sudo rm -vf /var/lib/apt/lists/*
sudo apt-get update
sudo apt-get dist-upgrade