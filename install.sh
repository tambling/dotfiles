#!/bin/zsh
set -ex

setopt extended_glob
setopt null_glob

sudo chsh -s $(which zsh) $USER

if command -v brew > /dev/null
then
  update_command="brew update"
  install_command="brew install"
elif command -v pacman > /dev/null
then
  update_command="pacman -Syu"
  install_command="pacman -S"
elif command -v apt > /dev/null
then
  update_command="apt update"
  install_command="apt install"
fi

eval "sudo $update_command"
eval "yes | sudo $install_command neovim ripgrep tmux"

CURRENT_DIRECTORY="$(pwd -P)"

for f in **/*~*.sh
do
  ln -fs  "$CURRENT_DIRECTORY/$f" "$HOME/.$f"
done

rbenv_directory="$HOME/.rbenv"
if [[ ! -f "$rbenv_directory/bin/rbenv" ]]; then
  rm -rf $rbenv_directory
  git clone https://github.com/rbenv/rbenv.git $rbenv_directory
fi

ruby_build_directory="$rbenv_directory/plugins/ruby-build"
if [[ -d $ruby_build_directory ]]; then
  git -C $ruby_build_directory pull > /dev/null
else
  git clone https://github.com/rbenv/ruby-build.git $ruby_build_directory
fi

nodenv_directory="$HOME/.nodenv"
if [[ -d $nodenv_directory ]]; then
  git -C $nodenv_directory pull > /dev/null
else
  git clone https://github.com/nodenv/nodenv.git $nodenv_directory
fi

node_build_directory="$nodenv_directory/plugins/node-build"
if [[ -d $node_build_directory ]]; then
  git -C $node_build_directory pull > /dev/null
else
  mkdir -p $node_build_directory
  git clone http://github.com/nodenv/node-build.git $node_build_directory
fi

zsh_directory="$HOME/.zsh"
if [[ ! -d $zsh_directory ]]; then
  mkdir -p $zsh_directory
fi

spaceship_directory="$zsh_directory/spaceship"
spaceship_executable="$spaceship_directory/spaceship.zsh"

if [[ ! -f $spaceship_executable ]]; then
  git clone --depth=1 https://github.com/spaceship-prompt/spaceship-prompt.git "$spaceship_directory"
fi
