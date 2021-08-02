if [ -x "$(command -v brew)" ]
then
  brew install rcm
else
  sudo apt update
  sudo apt install rcm
fi

curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh

git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"

if [ -d "${HOME}/dotfiles" ] && [ ! -d "${HOME}/.dotfiles" ]; then
  mv "${HOME}/dotfiles" "${HOME}/.dotfiles"
fi

rcup -f -x -- *.sh
