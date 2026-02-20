#!/bin/bash
set -ex

export NONINTERACTIVE=1

shopt -s nullglob

# Install Ubuntu prerequisites for Homebrew and the rest of the setup
if command -v apt-get >/dev/null 2>&1; then
  sudo apt-get update
  sudo apt-get install -y build-essential procps curl file git zsh
fi

sudo chsh -s $(which zsh) $USER

CURRENT_DIRECTORY="$(pwd -P)"

find * -type d -exec mkdir -p $HOME/.{} \;
find * -type f -exec ln -fs $CURRENT_DIRECTORY/{} $HOME/.{} \;

zsh_directory="$HOME/.zsh"
if [[ ! -d $zsh_directory ]]; then
  mkdir -p $zsh_directory
fi

spaceship_directory="$zsh_directory/spaceship"
spaceship_executable="$spaceship_directory/spaceship.zsh"

if [[ ! -f $spaceship_executable ]]; then
  git clone --depth=1 https://github.com/spaceship-prompt/spaceship-prompt.git "$spaceship_directory"
fi

# Install linuxbrew if needed
if ! command -v brew >/dev/null 2>&1; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

brew update
brew install neovim ripgrep tmux

# Install vim-plug and plugins for neovim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim --headless +PlugInstall +qall || true

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
