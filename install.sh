#!/bin/bash
set -ex

shopt -s extglob

sudo chsh -s $(which zsh) $USER

CURRENT_DIRECTORY="$(pwd -P)"

for f in !(*.sh)
do
  ln -fs  "$CURRENT_DIRECTORY/$f" "$HOME/.$f"
done

source "~/.zshrc"
