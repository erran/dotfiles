# Interactive Ruby Shell fish completions
complete -c irb -s r -l require -a "(gem list --no-versions --no-details --local | sed 's/-/\//g')" --description 'Require library'
