function diff --wraps diff --description "Colorizes diff output, with support for delta and diff-so-fancy."
    if type -q delta
        command diff "$argv" | command delta
    else if type -q diff-so-fancy
        command diff "$argv" | command diff-so-fancy
    else
        command diff --color "$argv"
    end
end
