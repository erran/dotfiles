# Extra Ruby completions
set -l __ruby_completion_files (ls $fish_complete_path/ruby.fish  ^ /dev/null)
test -n '$__ruby_completion_files'; or source $__ruby_completion_files

complete -c ruby -s r -l require -a "(gem list --no-versions --no-details --local | sed 's/-/\//g')" --description 'Require library'
