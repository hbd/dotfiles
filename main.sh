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

# function arv {
    # docker-machine create --virtualbox-disk-size "20480" --virtualbox-memory "4096" --virtualbox-cpu-count "4" dev
    # kubernetes
    # brew install helm docker-machine-driver-hyperkit
# }

function main {
    # install brew if not found.
    # OS=`uname -s`
    # if [ "$OS" = "Darwin" ] && [ -x "$(hash brew 2>/dev/null)" ]; then /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"; fi

    # install most docker zsh diff-so-fancy python3 ag go terraform node
    # brew install golangci/tap/golangci-lint
    # pip install --user powerline-status
    # brew tap homebrew/cask-fonts; brew cask install font-fira-code font-fira-mono-for-powerline
    # pip install powerline-gitstatus
    # tmux/fonts/install.sh
    # go install goimports

    # brew update && brew upgrade # to be safe.
#     brew install \
#	 python go \
#	 tmux zsh emacs \
#	 diff-so-fancy ag gpg2 nvm npm htop \
#	 golangci/tap/golangci-lint

    # fonts.
#    brew tap homebrew/cask-fonts && \
#	brew cask install \
#	     font-fira-code font-fira-mono-for-powerline

#    pip3 install --user powerline-status
#    pip3 install powerline-gitstatus
#    ~/.dotfiles/tmux/fonts/install.sh

    # mac specific.
#    if [ "$OS" = "Darwin" ]; then
#	brew install coreutils gnupg
#	brew cask install virtualbox spectacle iterm2
#    fi

    link zsh
    link git
    link emacs
    link tmux
    ln -s ~/.dotfiles/iterm ~/iterm
}

main

