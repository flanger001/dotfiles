alias sudo='sudo '

## Git
alias st='git status'
alias br='git branch'
alias add='git add . && git status'
alias ci='git commit -a -m'
alias co='git checkout'
alias mg='git merge'
alias pull='git pull'
alias push='git push'
alias glo="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --since=2.weeks"
alias git-head='echo -n  | pbcopy'
# alias git-head='git rev-parse head | tr -d '\n' | pbcopy'

## Rails
alias r='rails'

## Finder
alias d='cd ~/Documents'
alias ls='ls -GFh'
alias la='ls -GFhla'
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

## Admin
alias dnsmasqup='sudo launchctl start homebrew.mxcl.dnsmasq'
alias dnsmasqdo='sudo launchctl stop homebrew.mxcl.dnsmasq'

