### Aliases ###
alias ls="ls -G --group-directories-first"
alias la="ls -Ga"
alias sudo="sudo "

### Functions ###
reset-network() {
  sudo modprobe -r igc
  sudo modprobe -i igc
}

tldr() {
  curl "cheat.sh/$1"
}

### X410 configuration ###
# Display scaling
export GDK_SCALE=2

# socat configuration
x11_socket="/tmp/.X11-unix/X0"
if [[ ! -e "$x11_socket" ]]; then
    mkdir -p "/tmp/.X11-unix"
    socat -b65536 UNIX-LISTEN:$x11_socket,fork,mode=777 VSOCK-CONNECT:2:6000 &
    export DISPLAY=":0.0"
fi
unset x11_socket

### Exports & PATH ###
export EDITOR="subl --wait"
export WIN_ROOT="/mnt/c/Users/David Shaffer/"

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
    source "$HOME/.cargo/env"
fi
