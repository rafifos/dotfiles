function cat --wraps cat --wraps bat --description "Replaces cat(1) with bat(1)"
    if type -q bat
        bat "$argv"
    else
        cat "$argv"
    end
end
