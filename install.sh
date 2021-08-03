if [ -x "$(command -v brew)" ]
then
  brew install rcm
else
  sudo apt update
  sudo apt install rcm
fi

curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
npm i -g spaceship-prompt


if [ ! -d "${HOME}/.dotfiles" ]; then
  mkdir "~/.dotfiles"
  mv "./*" "${HOME}/.dotfiles"
fi

rcup -f -x -- *.sh
