function htop --wraps htop --wraps btm --description "Replaces htop(1) with bottom(1)"
    if type -q btm
        command btm --basic "$argv"
    else
        command htop "$argv"
    end
end
