function rm --wraps rm
    command rm $argv

    _deprecate_command rm rip
end
