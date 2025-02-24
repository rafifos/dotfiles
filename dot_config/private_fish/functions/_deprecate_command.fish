function _deprecate_command --description 'Deprecates a command by printing a message after running it.'
    if status --is-interactive
        set -l command $argv[1]
        set -l alternative $argv[2]

        echo -n "Deprecation warning: "
        set_color $fish_color_error
        echo -n "$command "
        set_color $fish_color_normal
        echo -n "is deprecated. Use "
        set_color $fish_color_command
        echo -n "$alternative "
        set_color $fish_color_normal
        echo "instead."
    end
end
