### Aliases ###
alias ls="ls --group-directories-first"

### Functions ###
reset-network() {
  sudo modprobe -r igc
  sudo modprobe -i igc
}

tldr() {
  curl "cheat.sh/$1"
}

### Exports & PATH ###
RESET="$(tput sgr0)"
BOLD="$(tput bold)"
WHITE="$(tput setaf 007)"
PURPLE="$(tput setaf 5)"

export PS1="\[${RESET}\]\[${BOLD}\]\[${WHITE}\]\D{%F} \t\[${RESET}\] \[${PURPLE}\]\u\[${RESET}\] \W \$ "
export GPG_TTY=$(tty)

export PYENV_ROOT="$HOME/.pyenv"
export RBENV_ROOT="$HOME/.rbenv"
export NODENV_ROOT="$HOME/.nodenv"

export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="$RBENV_ROOT/bin:$PATH"
export PATH="$NODENV_ROOT/bin:$PATH"

if command -v rbenv 1>/dev/null 2>&1; then
  eval "$(rbenv init -)"
fi

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

if command -v nodenv 1>/dev/null 2>&1; then
  eval "$(nodenv init -)"
fi

export PATH=$PATH:/usr/local/go/bin

if [[ -e "$HOME/.cargo/env" ]]; then
  . "$HOME/.cargo/env"
fi

if type rg &> /dev/null; then
  export FZF_DEFAULT_COMMAND="rg --files"
  export FZF_DEFAULT_OPTS="-m"
fi
