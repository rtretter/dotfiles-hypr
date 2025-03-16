#!/bin/bash
cd "$(dirname "$0")"

echo "Running in: $(pwd)!"
read -p "Press any key to continue..." -sn 1

configs=("dunst" "hypr" "kitty" "nvim" "waybar" "wofi" "pipewire" "wlogout")

rm -rf .config
mkdir .config

for i in ${configs[@]}
do
	echo Copying: $i
	cp -r ~/.config/$i .config/
done

rm -rf .local

mkdir -p .local/share

cp -r ~/.local/bin .local/bin
cp -r ~/.local/share/dunst .local/share/dunst
cp -r ~/.local/share/wlogout .local/share/wlogout

rm -rf wallpapers
cp -r /usr/share/wallpapers wallpapers

cp ~/.bashrc .
cp ~/.inputrc .

cp /etc/sddm.conf.d/sddm.conf ./sddm.conf
cp /usr/share/sddm/scripts/Xsetup ./Xsetup
rm -rf sddm-themes
mkdir sddm-themes
cp -r /usr/share/sddm/themes/* sddm-themes/

pacman -Qqen > pkglist.txt
pacman -Qqem > foreignpkglist.txt
