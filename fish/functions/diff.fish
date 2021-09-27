function diff --wraps diff --description "Colorizes diff output, with support for delta and diff-so-fancy."
    if type -q delta
        diff "$argv" | delta
    else if type -q diff-so-fancy
        diff "$argv" | diff-so-fancy
    else
        diff --color "$argv"
    end
end
