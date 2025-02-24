function unzip --wraps unzip
    command unzip $argv

    _deprecate_command unzip ouch
end
