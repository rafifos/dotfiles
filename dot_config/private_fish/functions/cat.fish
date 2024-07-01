function cat --wraps cat
    command cat $argv

    _deprecate_command cat bat
end
