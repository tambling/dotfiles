# Setup fzf
# ---------
# Detect fzf install location: Linux Homebrew takes priority, then macOS Homebrew
_fzf_home=""
if [[ -d "/home/linuxbrew/.linuxbrew/opt/fzf" ]]; then
  _fzf_home="/home/linuxbrew/.linuxbrew/opt/fzf"
elif [[ -d "/usr/local/opt/fzf" ]]; then
  _fzf_home="/usr/local/opt/fzf"
fi

if [[ -n "$_fzf_home" ]]; then
  if [[ ! "$PATH" == *"$_fzf_home/bin"* ]]; then
    export PATH="${PATH}:${_fzf_home}/bin"
  fi

  # Man path
  # --------
  if [[ ! "$MANPATH" == *"$_fzf_home/man"* && -d "${_fzf_home}/man" ]]; then
    export MANPATH="${MANPATH}:${_fzf_home}/man"
  fi

  # Auto-completion
  # ---------------
  [[ $- == *i* ]] && source "${_fzf_home}/shell/completion.zsh" 2> /dev/null

  # Key bindings
  # ------------
  # source "${_fzf_home}/shell/key-bindings.zsh"
fi

if command -v rg > /dev/null; then
  export FZF_DEFAULT_COMMAND='rg --files'
fi
