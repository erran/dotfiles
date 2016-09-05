# Fish shell customization

set -l __fortune (fortune -s)
set --export fish_greeting $__fortune

# env
set --export EDITOR vim

# $PATH
set --export PATH $HOME/bin $HOME/.bin $HOME/.rbenv/bin ~/Library/gradle-2.12/bin ~/Applications/SoapUI-5.0.0.app/Contents/java/app/bin /usr/local/bin /usr/X11/bin /usr/local/heroku/bin /usr/local/share/npm/bin /Applications/Postgres.app/Contents/Versions/9.4/bin ~/Library/Haskell/bin /Applications/VirtualBox.app/Contents/MacOS $PATH

# Ruby version management
. (rbenv init - | psub)
set PATH $HOME/.rbenv/bin $PATH
set PATH $HOME/.rbenv/shims $PATH
rbenv rehash >/dev/null ^&1

# Java version management
set --export JAVA_HOME (/usr/libexec/java_home)
set --export TERM xterm-256color

#set fish_function_path $fish_function_path "/usr/local/lib/python2.7/site-packages/powerline/bindings/fish"
#powerline-setup
