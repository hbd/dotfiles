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
    # install brew if not found.
    # HOMEBREW_URL='/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"'
    # if uname == Darwin && (hash brew; $? == 1); then curl $HOMEBREW_URL; fi

    brew install python go tmux zsh emacs diff-so-fancy ag gpg2 nvm htop terraform most
    brew install iterm2 --cask # spectacle
    brew tap homebrew/cask-fonts; brew cask install font-fira-code font-fira-mono-for-powerline
    brew install golangci/tap/golangci-lint

    pip3 install --user powerline-status
    pip3 install powerline-gitstatus
    ~/.dotfiles/tmux/fonts/install.sh

    link zsh
    link git
    link emacs
    link tmux
    ln -s ~/.dotfiles/iterm ~/iterm
}

main

function legacy {
    # docker-machine create --virtualbox-disk-size "20480" --virtualbox-memory "4096" --virtualbox-cpu-count "4" dev

    # mac specific.
    # if uname == Darwin then
    #   install brew docker-machine coreutils gnupg; brew cask install virtualbox spectacle iterm2

    # kubernetes
    # brew install helm docker-machine-driver-hyperkit
}
