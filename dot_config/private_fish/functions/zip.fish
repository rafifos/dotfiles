function zip --wraps zip
    command zip $argv

    _deprecate_command zip ouch
end
