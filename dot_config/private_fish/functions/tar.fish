function tar --wraps tar
    command tar $argv

    _deprecate_command tar ouch
end
