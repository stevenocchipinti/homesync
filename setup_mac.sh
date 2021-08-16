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

# Fish
brew install fish
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
fish --command="fisher install jethrokuan/z"

# Generic stuff
brew install git exa bat fd git-delta ripgrep vifm gnu-sed
brew install iterm2 visual-studio-code docker keepingyouawake

# Vim
brew install neovim
git clone https://github.com/stevenocchipinti/nvim ~/.config/nvim

# Javascript
curl -fsSL https://fnm.vercel.app/install | bash
fish --command="fnm install --lts"
fish --command="npm install --global yarn"
