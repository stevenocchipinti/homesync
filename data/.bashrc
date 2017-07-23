# .bashrc

# Source the aliases
[ -f ~/.aliases ] && . ~/.aliases

# Enable bash completion in interactive shells
[ -f /etc/bash_completion ] && ! shopt -oq posix && . /etc/bash_completion


# Source git (and ruby) stuff (including the prompt)
if [ -f ~/.bash_git ]; then
  . ~/.bash_git
else
  # Prompt colors
  RED='\[\e[00;31m\]'
  BOLD_RED='\[\e[01;31m\]'
  GREEN='\[\e[00;32m\]'
  BOLD_GREEN='\[\e[01;32m\]'
  YELLOW='\[\e[00;33m\]'
  BOLD_YELLOW='\[\e[01;33m\]'
  BLUE='\[\e[00;34m\]'
  BOLD_BLUE='\[\e[01;34m\]'
  NO_COLOR='\[\e[0m\]'
  # Set the prompt using the colors above
  # There is also one of these in the bash_git file
  export PS1="$BOLD_GREEN\u@\h$NO_COLOR:$BOLD_BLUE\w\n$YELLOW[\!]$NO_COLOR\\$> "
  #export PS1="$GREEN\u@\h:$YELLOW\w\n$YELLOW[\!]$NO_COLOR\\$> "
  # TODO: Add error code to prompt like this:
  # \u@\h.\[\e[33;40m\]cp`r=$?; test $r -ne 0 && echo " \[\e[1;24;31;40m\]($r)"`\[\e[m\] \W \$
fi

# User specified $PATH
export PATH=$PATH:/usr/kerberos/bin:/usr/lib64/ccache:/usr/local/bin:/usr/bin:/bin:/usr/X11R6/bin:/sbin:~/bin

# Make vim the default editor for things like svn, etc.
export EDITOR=vim

# Do not store commands that start with a space in the bash_history file
export HISTCONTROL=ignorespace

# Make bash behave like vim!
#set -o vi
# Make sure Ctrl-L still clears the screen in vi-mode
#bind -m vi-insert 'Control-l: clear-screen'

# http://www.geocities.com/h2428/petar/bash_hist.htm
#
# Use Up or Down arrow keys for commandline history search
#   eg. Type the command and pressing Up or Down arrow
bind '"\e[A"':history-search-backward
bind '"\e[B"':history-search-forward

# expand any '!' combinations from the command line.
#   eg dkpun@chamois4:~/$ !grep<space>
bind Space:magic-space

# Use z for changing directories
source ~/bin/z.sh

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export ANDROID_HOME="/opt/adt-bundle-mac-x86_64-20140702/sdk/"

# which direnv && eval "$(direnv hook bash)"

alias fuck='eval $(thefuck $(fc -ln -1)); history -r'

# These are sources last so they override anything in here

# Source Mac specific settings
[ `uname` == 'Darwin' ] && [ -f ~/.mac ] && . ~/.mac

# Source REA specific settings
[ -f ~/.rea ] && . ~/.rea


export N_PREFIX="$HOME/.n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).
