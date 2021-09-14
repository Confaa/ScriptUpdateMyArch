#!/bin/bash

echo "Actualizando sistema"
echo ""
sudo pacman -Syu --noconfirm

pacman -Qqm > listaAur.txt
repoScript=$(pwd)

while read dependencia
do
    if [ -d ~/AUR/$dependencia/ ]
    then
        cd ~/AUR/$dependencia/
        aux=$(git pull 2>&1)
        [[ "$aux" == "Already up to date." ]] && echo "$dependencia actualizada" || makepkg -si --noconfirm
    else
        echo "El directorio $dependencia no existe"
        cd ~/AUR/
        git clone https://aur.archlinux.org/$dependencia.git
        cd $dependencia
        makepkg -si --noconfirm
    fi
    rm *.gz *.zst *.rpm 2> /dev/null
done < listaAur.txt

cd $repoScript
rm listaAur.txt

