# Colors
source ~/.bash_color_vars
source ~/.bash_colors


# Path stuff
export PATH=/usr/local/bin:~/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH=/Applications/Postgres.app/Contents/Versions/9.3/bin:$PATH
export PATH=/usr/local/php5/bin:$PATH
export PATH=~/.composer/vendor/bin:$PATH

# Variables
source ~/.bash_vars

# Aliases
source ~/.bash_aliases

source ~/.profile

# For RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Functions
source ~/.bash_functions

