brew install rcm

if [ ! -d "${HOME}/.dotfiles" ]; then
  mkdir "${HOME}/.dotfiles"
  mv "./*" "${HOME}/.dotfiles"
fi

rcup -f -x -- *.sh
