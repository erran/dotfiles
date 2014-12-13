function fish_prompt --description 'Write out the prompt'
  set -l last_status $status

  set_color $fish_color_host
  printf '%s ' (hostname -s)

  set_color normal
  printf '@ '

  switch $USER
  case 'root'
    set_color $fish_color_cwd_root
  case '*'
    set_color $fish_color_cwd
  end

  echo -n (prompt_pwd)
  set_color normal

  printf '%s ' (__fish_git_prompt)

  if not test $last_status -eq 0
    set_color $fish_color_error
  end

  switch $USER
  case 'root'
    echo -n '√ '
  case '*'
    echo -n 'λ '
  end
end
