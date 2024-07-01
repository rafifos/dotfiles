function find --wraps find
    command find $argv

    _deprecate_command find fd
end
