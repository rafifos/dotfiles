function boxfish --description "boxfish: A theme originally based on joelwanner/theme-boxfish."
    # Prevents fish from showing stuff on the right of the prompt.
    set -g fish_right_prompt

    set -l last_command_status $status
    set -l cwd

    if test "$theme_short_path" = yes
        set cwd (basename (prompt_pwd))
    else
        set cwd (prompt_pwd)
    end

    # last command status, if it wasn't zero.
    if not test $last_command_status -eq 0
        set_color $fish_color_text_on_light --bold --background $fish_color_error
        echo -n " $last_command_status "
        set_color $fish_color_normal
    end

    # cwd
    set_color $fish_color_text_on_light --background $fish_color_cwd
    echo -n " $cwd "

    # git branch and dirty state
    set -l git_branch (command git symbolic-ref HEAD 2> /dev/null | command sed -e 's|^refs/heads/||')
    set -l git_dirty (command git status -s --ignore-submodules=dirty 2> /dev/null)
    if test -n "$git_branch"
        if test -n "$git_dirty"
            set_color $fish_color_text_on_light --background $fish_color_git_dirty_bg
        else
            set_color $fish_color_normal --background $fish_color_git_bg
        end

        echo -n " $git_branch "
    end

    set_color normal
    echo -n ' '
end
