function apt --wraps apt --wraps nala --description "Replaces APT(8) with Nala(8)"
    if status --is-interactive; and type -q nala
        # Nala is pretty-much 100% compatible with apt command-wise.
        command nala "$argv"
    else
        command apt "$argv"
    end
end
