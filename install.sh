#!/bin/bash
set -ex

shopt -s extglob

sudo chsh -s $(which zsh) $USER

if command -v brew > /dev/null
then
  package_manager="brew"
  install_command="brew install"
elif command -v apt-get > /dev/null
then
  package_manager="apt-get"
  install_command="apt-get install -y"
fi

sudo $package_manager update
sudo $install_command neovim ripgrep tmux

CURRENT_DIRECTORY="$(pwd -P)"

for f in !(*.sh)
do
  ln -fs  "$CURRENT_DIRECTORY/$f" "$HOME/.$f"
done

zsh
