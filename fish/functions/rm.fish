function rm --wraps rip --wraps rm --description "Replaces rm(1) with rip"
    if type -q rip
        # Prints some info about TARGET before prompting for action.
        rip --inspect "$argv"
    else
        rm -vi "$argv"
    end
end
