#!/bin/bash

function echo2 {
    echo $1 >&2
}

# link symlinks to $HOME all files in dir named $1 and whose name contains $1.
# example usage: link zsh
function link {
    echo2 "linking files in $1..."
    local files=$(ls -a $1 | grep $1)
    local curdir=$(pwd)
    for f in $files; do
	path="$HOME/$f"
	[ -h "$path" ] && echo "$path exists" || (echo2 "linking $path" && ln -s $curdir/$1/$f $path)
    done
}

function main {
    # install most docker zsh diff-so-fancy python3 ag go terraform node
    # brew install golangci/tap/golangci-lint
    # pip install --user powerline-status
    # brew tap homebrew/cask-fonts; brew cask install font-fira-code font-fira-mono-for-powerline
    # pip install powerline-gitstatus
    # tmux/fonts/install.sh

    # docker-machine create --virtualbox-disk-size "20480" --virtualbox-memory "4096" --virtualbox-cpu-count "4" dev

    # mac specific.
    # if uname == Darwin then
    #   install brew docker-machine coreutils gnupg; brew cask install virtualbox spectacle iterm2

    # kubernetes
    # brew install helm docker-machine-driver-hyperkit

    # install nvm.
    # curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.1/install.sh | bash

    link zsh
    link git
    link emacs
    link tmux
    ln -s ~/.dotfiles/iterm ~/iterm
}

main
