function extract_version_from -d "Extract a semver from a string"
  echo $argv | \grep -o "\d\+\.\d\+\.\d\+"
end

function fish_prompt --description 'Write out the prompt'
  set -l last_status $status

  # Background jobs
  set -l jobs (jobs | wc -l | tr -d '[:space:]')
  if test $jobs -eq 1
    set_color magenta
    echo -n '⎋ '
  else if test $jobs -gt 1
    set_color magenta
    echo -n $jobs'⎋ '
  end

  # Node version
  set_color green
  set -l node_version (extract_version_from (node -v))
  echo -n $node_version' '

  # Ruby version
  set_color red
  set -l ruby_version (extract_version_from (ruby -v))
  echo -n $ruby_version' '

  # Responsive PWD
  set_color blue
  set -g fish_prompt_pwd_dir_length 0
  set -l pwd_length (string length $node_version' '$ruby_version' '(prompt_pwd))
  if test $pwd_length -gt $COLUMNS
    set -g fish_prompt_pwd_dir_length 1
  end
  echo (prompt_pwd)

  # Git status prompt
  set_color normal
  set -l git_prompt (~/.git_status_prompt)
  echo -n $git_prompt

  # Colored icon based on exit status
  set_color white
  if not test $last_status -eq 0
    set_color $fish_color_error
  end
  echo -n '➤ '
  set_color normal
end
