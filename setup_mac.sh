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
brew install cask wget nmap git exa bat keepingyouawake visual-studio-code
brew cask install iterm2 slack docker

# Vim
brew install neovim
git clone https://github.com/stevenocchipinti/nvim ~/.config/nvim

# Ruby
#brew install chruby ruby-install
#ruby-install ruby --no-reinstall
#gem install bundle nokogiri

# Javascript
curl -fsSL https://fnm.vercel.app/install | bash
fish --command="fnm install --lts"
fish --command="npm install --global yarn"
