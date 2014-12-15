# Fish shell customization
set -l __fortune (fortune -s)
# say $__fortune &
set --export fish_greeting $__fortune

# env
set --export EDITOR vim

# $PATH
set --export PATH set PATH $HOME/bin $HOME/.bin $HOME/.rbenv/bin /usr/local/bin /usr/X11/bin /usr/local/heroku/bin /usr/local/share/npm/bin /Applications/Postgres.app/Contents/Versions/9.3/bin ~/Library/Haskell/bin $PATH

# Ruby version management
. (rbenv init - | psub)
set PATH $HOME/.rbenv/bin $PATH
set PATH $HOME/.rbenv/shims $PATH
rbenv rehash >/dev/null ^&1

# Java version management
set --export JAVA_HOME (/usr/libexec/java_home)
