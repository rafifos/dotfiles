function ls --wraps ls
    command ls $argv

    _deprecate_command ls eza
end
