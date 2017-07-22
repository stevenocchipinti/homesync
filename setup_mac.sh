#!/bin/bash
################################################################################
#                                                                              #
#                           HomeSync - setup_mac.sh                            #
#                                                                              #
# This script will setup my dev environment on a mac                           #
#                                                                              #
# @steveocchipinti                                                             #
# http://StevenOcchipinti.com                                                  #
# https://github.com/stevenocchipinti/homesync                                 #
#                                                                              #
################################################################################

# Homebrew
if ! hash brew 2> /dev/null; then
  echo "You need brew, installing it now..."
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Generic stuff
brew install cask wget tree nmap ctags git hub bash-completion keepingyouawake atom
brew cask install iterm2 mattr-slate slack docker gimp

# Vim
brew install macvim neovim/neovim/neovim
git clone https://github.com/stevenocchipinti/nvim ~/.config/nvim
nvim +PlugInstall +qall

# Ruby
brew install chruby ruby-install
ruby-install ruby --no-reinstall

# Javascript
brew install node
npm install -g n yarn
n latest
