#!/bin/bash
############################
# .make.sh
# This script installs homebrew along with a few packages
############################

#Homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

#Packages
brew install emacs
brew install ffmpeg
brew install node
brew install youtube-dl
