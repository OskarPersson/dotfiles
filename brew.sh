#!/bin/bash
############################
# .make.sh
# This script installs homebrew along with a few packages
############################

#Homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

#Packages
brew install asciinema
brew install ffmpeg
brew install htop
brew install pyenv
brew install pyenv-virtualenv
brew install ripgrep
brew install vim
brew install youtube-dl
