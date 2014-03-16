# RubyMotion fish completion

# Flags
complete -c motion -f -s h -l help
complete -c motion -f -s v -l version

# Subcommands
complete -c motion -f -n '__fish_use_subcommand' -a account --description 'Access the software license account'
complete -c motion -f -n '__fish_use_subcommand' -a activate --description 'Activate the software license'
complete -c motion -f -n '__fish_use_subcommand' -a changelog --description 'View the changelog'
complete -c motion -f -n '__fish_use_subcommand' -a create --description 'Create a new project'
complete -c motion -f -n '__fish_use_subcommand' -a device:console --description 'Print the device console logs'
complete -c motion -f -n '__fish_use_subcommand' -a ri --description 'Display API reference'
complete -c motion -f -n '__fish_use_subcommand' -a support --description 'Create a support ticket'
complete -c motion -f -n '__fish_use_subcommand' -a update --description 'Update the software'
complete -c motion -f -n '__fish_use_subcommand' -a joybox:generate --description 'Joybox: Class Generator'
