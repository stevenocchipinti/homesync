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
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  (echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/steve.occhipinti/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Fish
brew install fish
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
fish --command="fisher install jethrokuan/z"

# Generic stuff
brew install git eza bat fd git-delta ripgrep gnu-sed
brew install iterm2 visual-studio-code docker

# Vim
brew install neovim
git clone https://github.com/stevenocchipinti/nvim ~/.config/nvim

# Javascript
curl -fsSL https://fnm.vercel.app/install | bash
fish --command="fnm install --lts"
