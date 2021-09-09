# Fish shell customization

set -l __fortune (fortune -s)
set --export fish_greeting $__fortune

# env
set --export EDITOR vim

# $PATH
fish_add_path $HOME/bin
fish_add_path $HOME/.bin
fish_add_path /usr/local/bin
fish_add_path $HOME/go/bin

set --export TERM xterm-256color

if not pgrep -f ssh-agent > /dev/null
  eval (ssh-agent -c)
  set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK
  set -Ux SSH_AGENT_PID $SSH_AGENT_PID
  set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK
end

nvm use (cat .nvmrc ^ /dev/null; or echo 'stable') > /dev/null
fish_add_path /usr/local/opt/libpq/bin
