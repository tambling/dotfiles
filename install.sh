if [ -x "$(command -v brew)" ]
then
  brew install rcm tmux fzf
else
  sudo apt update
  sudo apt install rcm tmux fzf
fi

curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
npm i -g spaceship-prompt


if [ ! -d "~/.dotfiles" ]; then
  mkdir ~/.dotfiles
  mv ./* ~/.dotfiles
fi

rcup -f -x -- *.sh
