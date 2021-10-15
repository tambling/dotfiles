#!/bin/bash
set -ex

shopt -s extglob

chsh -s $(which zsh)

CURRENT_DIRECTORY="$(pwd -P)"

for f in !(*.sh)
do
  ln -fs  "$CURRENT_DIRECTORY/$f" "$HOME/.$f"
done

git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

brew install fzf
