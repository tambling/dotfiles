# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

export EDITOR="vim"
export PGDATA="/usr/local/var/postgres"

export GOPATH="$HOME/.go"

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Disable flow control commands (keeps C-s from freezing everything)
stty start undef
stty stop undef

alias reload='source ~/.zshrc'
alias vim='nvim'

export CASE_SENSITIVE=false
setopt MENU_COMPLETE

rbenv_directory="$HOME/.rbenv"
eval "$($rbenv_directory/bin/rbenv init - zsh)"

nodenv_directory="$HOME/.nodenv"
export PATH="$nodenv_directory/bin:$PATH"
eval "$(nodenv init - zsh)"

source "$HOME/.zsh/spaceship/spaceship.zsh"

export GPG_TTY=$(tty)

export PATH="/usr/local/sbin:$PATH"

if [ -f "$HOME/.secrets" ]
then
  source $HOME/.secrets
fi

# shellenv linuxbrew if it's present
if [ -f "/home/linuxbrew/.linuxbrew/bin/brew" ]
then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi
