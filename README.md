# Dotfiles

My git and bash stuff. Assumptions:

* Running macOS
* Using `rbenv` for ruby
* Using `nvm` for node
* `gpg` exists somewhere in your path
* There is a `~/scripts` directory in the home dir
* Other stuff, probably

The cool part with this is I keep all my code in Dropbox, so if I go to another machine, all I need to do is:

```bash
$ echo -e "source ~/Dropbox/Coding/Personal/dotfiles/bash/profile" > ~/.bash_profile
$ echo -e "[include]\n    path = \"~/Dropbox/Coding/Personal/dotfiles/git/config\"" > .gitconfig
```

Everything works as expected!
