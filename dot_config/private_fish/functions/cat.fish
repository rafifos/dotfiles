function cat --wraps cat --wraps bat --description "Replaces cat(1) with bat(1)"
    if type -q bat
        # Bat has it's own config file which allows us to pass arguments to it
        # without polluting this file. And they're global.
        command bat "$argv"
    else
        command cat "$argv"
    end
end
