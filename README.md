# Dotfiles

My git and shell stuff. Works for bash and zsh.

## Instructions

### Shell

Set `$DOTFILES_PATH` to wherever this repository is and put it in your shell config:

```shell
export DOTFILES_PATH="$HOME/Coding/dotfiles"
source "$DOTFILES_PATH/{SHELL}/{PLATFORM}/profile"
```

### Git

```shell
mkdir -p .config/git
cd $_
ln -s "$DOTFILES_PATH/git/config"
ln -s "$DOTFILES_PATH/git/aliases"
ln -s "$DOTFILES_PATH/git/ignore"
```