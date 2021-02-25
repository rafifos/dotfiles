function fish_prompt --description "Based on joelwanner/theme-boxfish."
    set -l last_command_status $status
    set -l cwd

    if test "$theme_short_path" = yes
        set cwd (basename (prompt_pwd))
    else
        set cwd (prompt_pwd)
    end

    # last command status, if it wasn't zero.
    if not test $last_command_status -eq 0
        set_color 2E3440 --bold --background $fish_color_error
        echo -n " $last_command_status "
        set_color $fish_color_normal
    end

    # cwd
    set_color 2E3440 --background $fish_color_cwd
    echo -n " $cwd "

    # git branch and dirty state
    set -l git_branch (command git symbolic-ref HEAD 2> /dev/null | sed -e 's|^refs/heads/||')
    set -l git_dirty (command git status -s --ignore-submodules=dirty 2> /dev/null)
    if test -n "$git_branch"
        if test -n "$git_dirty"
            set_color 2E3440 --background 81A1C1
        else
            set_color $fish_color_normal --background 4C566A
        end

        echo -n " $git_branch "
    end

    set_color normal
    echo -n ' '
end
