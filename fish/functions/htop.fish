function htop --wraps htop --wraps btm --description "Replaces htop(1) with bottom(1)"
    if type -q btm
        btm --basic "$argv"
    else
        htop "$argv"
    end
end
