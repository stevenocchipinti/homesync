set -x EDITOR nvim
set -x PATH ~/bin $PATH

if type -q bat
  alias cat=bat
end

if type -q nvim
  alias vim=nvim
end

if type -q exa
  alias l="exa --icons"
  alias ll="l -l"
  alias lt="l -T"
end
