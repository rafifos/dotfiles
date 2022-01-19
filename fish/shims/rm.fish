function rm --wraps rm --wraps rip --description "Replaces rm(1) with rip"
    if type -q rip
        # Prints some info about TARGET before prompting for action.
        command rip --inspect "$argv"
    else
        command rm -vi "$argv"
    end
end
