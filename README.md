# hbd's dotfiles

# SSH

`ssh-keygen -t ed25519`

# Homebrew

Multiple user installation, assuming `brew` group:

``` bash
brew doctor
sudo chgrp -R brew $(brew --prefix)/*
sudo chmod -R g+w $(brew --prefix)/*
brew doctor
```
