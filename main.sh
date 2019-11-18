#!/bin/bash

function echo2 {
    echo $1 >&2
}

# link symlinks to $HOME all files in dir named $1 and whose name contains $1.
# example usage: link zsh
function link {
    echo2 "linking files in $1..."
    local files=$(ls -a $1)
    local curdir=$(pwd)
    for f in $files; do
	path="$HOME/$f"
	[ -h "$path" ] && echo "$path exists" || (echo2 "linking $path" && ln -s $curdir/$1/$f $path)
    done
}

function main {
    # 
    # generate new ssh key
    # ssh-keygen -t rsa -b 4096
    # eval "$(ssh-agent -s)"
    # echo "Host *
  # AddKeysToAgent yes
  # UseKeychain yes
  # IdentityFile ~/.ssh/id_rsa" >> ~/.ssh/
    # echo "Add SSH key to Github."
    # wait for input/confirmation.

    # install coreutils

    # install brew
    # brew cask install spectacle iterm2 slack
    # brew install emacs
    # install zsh
    # set zsh as shell `sudo chsh -s $(which zsh) $(whoami)`
    # install oh-my-zsh # vendor instead?
    # install most docker
    # install zsh-multi-search
    # install diff-so-fancy

    # mac specific.
    # if uname == Darwin then install brew docker-machine

    link zsh
    link git
    link emacs
}

main
