# Dotfiles

My git and shell (Bash and Zsh) stuff. Works with [GNU Stow](https://www.gnu.org/software/stow/).

## Instructions

1. Install `stow` if you have not already: `sudo apt install stow` or `brew install stow`
1. Clone this repository and navigate to it.
    ```shell
    git clone git@github.com:flanger001/dotfiles.git && cd dotfiles
    ```
1. Check out the branch that corresponds with the platform you're using:
    ```shell
    git checkout linux # (or `git checkout wsl|mac`)
    ```
1. Use `stow` to create symlinks:
    ```shell
    stow -R --target="$HOME" -v2 .
    ```
