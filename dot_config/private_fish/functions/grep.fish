function grep --wraps grep
    command grep $argv

    _deprecate_command grep ripgrep
end
