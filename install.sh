#!/bin/bash
set -ex

shopt -s extglob

sudo chsh -s $(which zsh) $USER

if command -v brew > /dev/null
then
  package_manager="brew"
elif command -v apt-get > /dev/null
then
  package_manager="apt-get"
fi

sudo $package_manager install neovim ripgrep tmux

CURRENT_DIRECTORY="$(pwd -P)"

for f in !(*.sh)
do
  ln -fs  "$CURRENT_DIRECTORY/$f" "$HOME/.$f"
done

source "~/.zshrc"
