function diff --wraps diff --description "Colorizes diff output, with support for diff-so-fancy and delta."
    if type -q diff-so-fancy
        diff "$argv" | diff-so-fancy
    else if type -q delta
        diff "$argv" | delta
    else
        diff --color "$argv"
    end
end
