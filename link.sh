#!/usr/bin/env bash


echo "Linking config files..."

echo "Linking $PWD/zshrc";
ln -svi "$PWD/zshrc" ~/.zshrc;

echo "Linking $PWD/vimrc";
ln -svi "$PWD/vimrc" ~/.vimrc;

echo "Linking $PWD/tmux"; 
ln -svi "$PWD/tmux" ~/.tmux.conf;

echo "Linking $PWD/gitconfig";
ln -svi "$PWD/gitconfig" ~/.gitconfig;

echo "Linking $PWD/alacritty.yml";
ln -svi "$PWD/alacritty.yml" ~/.config/alacritty/alacritty.yml;

echo "Finished linking config files!";

echo "Linking scripts directory...";

ln -svi  "$PWD/scripts" ~/;

echo "Finished linking scripts directory!";
