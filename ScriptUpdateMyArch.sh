echo "Actualizando sistema"
sudo pacman -Syyu --noconfirm
#Birdtray
cd ~/AUR/birdtray/
aux=$(git pull 2>&1)
[[ "$aux" == "Already up to date." ]] && echo "Birdtray actualizada" || makepkg -si
##########
#Gitkraken
cd ~/AUR/gitkraken/
aux=$(git pull 2>&1)
[[ "$aux" == "Already up to date." ]] && echo "GitKraken actualizada" || makepkg -si
##########
#Visual Paradigm Community
cd ~/AUR/visual-paradigm-community/
aux=$(git pull 2>&1)
[[ "$aux" == "Already up to date." ]] && echo "Visual Paradigm Community actualizada" || makepkg -si
##########
#Visual Studio Code
cd ~/AUR/visual-studio-code-bin/
aux=$(git pull 2>&1)
[[ "$aux" == "Already up to date." ]] && echo "Visual Studio Code actualizada" || makepkg -si
##########
#YouTube Music Desktop App
cd ~/AUR/ytmdesktop/
aux=$(git pull 2>&1)
[[ "$aux" == "Already up to date." ]] && echo "YouTube Music Desktop App actualizada" || makepkg -si
##########
