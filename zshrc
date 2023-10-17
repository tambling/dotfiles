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

if command -v rbenv > /dev/null
then
  eval "$(rbenv init -)"
fi

if command -v nodenv > /dev/null
then
  eval "$(nodenv init -)"
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

source "$HOME/.zsh/spaceship/spaceship.zsh"

export GPG_TTY=$(tty)

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion

export PATH="/usr/local/sbin:$PATH"

if [ -f "$HOME/.secrets" ]
then
  source $HOME/.secrets
fi
