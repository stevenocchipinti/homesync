set -x EDITOR nvim
set -x PATH ~/bin $PATH

if type -q bat
  alias cat=bat
end

if type -q nvim
  alias vim=nvim
end

if type -q eza
  alias l="eza --icons"
  alias ls="l"
  alias la="l -a"
  alias ll="l -l"
  alias lal="l -al"
  alias lt="l -T"
end

# Disable the MOTD
set fish_greeting
