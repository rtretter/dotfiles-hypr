#!/bin/bash

configs=("dunst" "hypr" "kitty" "nvim" "waybar" "wofi")

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

rm -rf wallpapers
cp -r /usr/share/wallpapers wallpapers
