export EDITOR=nvim
bind '"\e[A"':history-search-backward
bind '"\e[B"':history-search-forward
bind Space:magic-space

# RUBY

source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh


# NODE

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# Tools

source ~/bin/z.sh
alias fuck='eval $(thefuck $(fc -ln -1)); history -r'
export PATH="/usr/local/heroku/bin:$PATH"
[ -f /Users/steve.occhipinti/.travis/travis.sh ] && source /Users/steve.occhipinti/.travis/travis.sh


# These are sourced last so they override anything in here

[ -f $(brew --prefix)/etc/bash_completion ] && . $(brew --prefix)/etc/bash_completion
[ -f ~/.bash_git_prompt ] && . ~/.bash_git_prompt
[ -f ~/.aliases ] && . ~/.aliases
[ -f ~/.rea ] && . ~/.rea
