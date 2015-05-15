### Aliases ###
alias ls="ls --group-directories-first"

showfiles() {
  if [ "$1" = "yes" ]
    then
    echo "Showing files"
    defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app
  elif [ "$1" = "no" ]
    then
    echo "Hiding files"
    defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app
  else
    echo "Doing nothing"
  fi
}

showfullpath() {
  if [ "$1" = "yes" ]
    then
    echo "Showing full path"
    defaults write com.apple.finder _FXShowPosixPathInTitle -bool true; killall Finder /System/Library/CoreServices/Finder.app
  elif [ "$1" = "no" ]
    then
    echo "Hiding full path"
    defaults write com.apple.finder _FXShowPosixPathInTitle -bool false; killall Finder /System/Library/CoreServices/Finder.app
  else
    echo "Doing nothing"
  fi
}

showdropshadow() {
  defaults write com.apple.screencapture disable-shadow -bool false
  restartfinder
}

hidedropshadow() {
  defaults write com.apple.screencapture disable-shadow -bool true
  restartfinder
}

restartfinder() {
  killall SystemUIServer
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
