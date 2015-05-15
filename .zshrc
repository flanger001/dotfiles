### Aliases ###
alias ls="ls -G"
alias la="ls -Ga"
alias sudo="sudo "

### Functions ###
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

dns-reset() {
  sudo killall -HUP mDNSResponder
}

tldr() {
  curl "cheat.sh/$1"
}

__load_root_path() {
  local root_path=$2
  local root_var=$1
  if [[ -e $root_path ]]; then
    export $root_var="$root_path"
    if [[ "$3" == "bin" ]]; then
      export PATH="$root_path/bin:$PATH"
    else
      export PATH="$root_path:$PATH"
    fi
  fi
}

weather() {
  curl v2.wttr.in
}

install_script() {
  # $1: Script name, e.g. geckodriver
  # $2: Script url, e.g. https://github.com/mozilla/geckodriver/releases/download/v0.29.1/geckodriver-v0.29.1-macos-aarch64.tar.gz

  local target_name=$1
  local download_path="$HOME/Downloads/tmp"
  local download_file="$download_path/$(basename $2)"
  local target_path="$HOME/scripts"

  echo "Creating directory $download_path"
  mkdir -pv $download_path
  echo "Creating directory $target_path"
  mkdir -pv $target_path

  echo "Downloading from $2"
  curl -L $2 -o $download_file

  if [[ "$2" =~ ".zip" ]]; then
    decompressor="unzip_to"
  elif [[ "$2" =~ ".tar.gz" ]]; then
    decompressor="untar_to"
  fi

  $decompressor $download_file $target_path $target_name

  echo "Making $target_path/$target_name executable"
  chmod +x $target_path/$target_name
  echo "Removing directory $download_path and its contents"
  rm -rf $download_path
  unset target_name download_path download_file target_path
}

unzip_to() {
  echo "Unzipping $1 to $2/$3"
  unzip $1 -d "$2"
}

untar_to() {
  tmpname="$(dirname $1)/tmp.tar"
  echo "Unzipping $1 to $tmpname"
  gzip -v -d $1 --stdout > $tmpname
  echo "Extracting $tmpname to $2/$3"
  tar -xv -C $2 -f $tmpname $3
}

get_ip() {
  local ods=$(dig +short myip.opendns.com @resolver1.opendns.com)
  if [[ -z "{#$ods}" ]]; then
    echo $ods;
  else
    dig -4 TXT +short o-o.myaddr.l.google.com @ns1.google.com
  fi;
}

export EDITOR="subl --wait"
export GPG_TTY="$(tty)"
export PS1="%B%D{%F} %*%b %F{green}%n%f %1~ %# "

setopt alwaystoend \
    autocd \
    autolist \
    autopushd \
    bashautolist \
    combiningchars \
    completeinword \
    extendedhistory \
    histexpiredupsfirst \
    histignoredups \
    histignorespace \
    histverify \
    interactive \
    interactivecomments \
    listambiguous \
    login \
    longlistjobs \
    monitor \
    nocasematch \
    noflowcontrol \
    promptsubst \
    pushdignoredups \
    pushdminus \
    sharehistory \
    zle

# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _correct
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}'
zstyle :compinstall filename '/Users/dshaffer/.zshrc'

autoload -Uz compinit
compinit

# End of lines added by compinstall

if [[ $(uname -m) == "arm64" ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

if [[ $(command -v brew) ]]; then
    export BREW_PREFIX="$(brew --prefix)"
    export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl)"
fi

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
