# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="spaceship"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

export EDITOR="vim"
export PGDATA="/usr/local/var/postgres"

export GOPATH="/Users/dean/.go"

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Disable flow control commands (keeps C-s from freezing everything)
stty start undef
stty stop undef

alias reload='source ~/.zshrc'

export CASE_SENSITIVE=false
setopt MENU_COMPLETE

eval "$(rbenv init -)"  
eval "$(nodenv init -)"

export GPG_TTY=$(tty)

precmd() { echo -ne "\033]0;$(whoami)@$(hostname):${PWD/#$HOME/~}\007" }

export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

# --END EXISTING SETTINGS--
export PATH="/usr/local/sbin:$PATH"

source $HOME/.secrets
