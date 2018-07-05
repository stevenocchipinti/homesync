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
brew install cask wget tree nmap ctags git hub bash-completion keepingyouawake visual-studio-code
brew cask install iterm2 mattr-slate slack docker gimp

# Vim
brew install macvim neovim
git clone https://github.com/stevenocchipinti/nvim ~/.config/nvim
nvim +PlugInstall +qall

# Ruby
brew install chruby ruby-install
ruby-install ruby --no-reinstall
gem install bundle nokogiri

# Javascript
brew install nvm
nvm install --lts
npm install -g yarn create-react-app

# Fish (fry uses ruby-install, fnm uses nvm)
brew install fish
curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher
fish --command="fisher bass fry fnm z"
fish --command="fnm lts"


# Will look to use this once the speed issues are resolved:
#   https://github.com/asdf-vm/asdf/issues/290
# brew install coreutils automake autoconf openssl libyaml readline libxslt libtool enixodbc
# brew install asdf
# echo "source /usr/local/opt/asdf/asdf.fish" >> ~/.config/fish/config.fish
# echo "source /usr/local/opt/asdf/asdf.sh" >> ~/.config/fish/bash_profile
# asdf plugin-add ruby
# asdf plugin-add nodejs
# NODEJS_CHECK_SIGNATURES=no asdf install
