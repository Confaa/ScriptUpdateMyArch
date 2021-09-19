#!/bin/bash

echo "Actualizando sistema"
echo ""
sudo pacman -Syu --noconfirm

pacman -Qqm > listaAur.txt
repoScript=$(pwd)

while read dependencia
do
    if [ -d ~/AUR/"$dependencia"/ ]
    then
        cd ~/AUR/"$dependencia"/ || exit
        aux=$(git pull 2>&1)
        [[ "$aux" == "Already up to date." ]] && echo "$dependencia actualizada" || makepkg -si --noconfirm
    else
        echo "El directorio $dependencia no existe"
        cd ~/AUR/ || exit
        git clone https://aur.archlinux.org/$dependencia.git
        cd "$dependencia" || exit
        makepkg -si --noconfirm
    fi
    rm *.gz *.zst *.rpm 2> /dev/null
done < listaAur.txt

cd "$repoScript" || exit
rm listaAur.txt

