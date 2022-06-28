# An arctic, north-bluish color scheme.
set -l nord0 2E3440
set -l nord1 3B4252
set -l nord2 434C5E
set -l nord3 4C566A
set -l nord4 D8DEE9
set -l nord5 E5E9F0
set -l nord6 ECEFF4
set -l nord7 8FBCBB
set -l nord8 88C0D0
set -l nord9 81A1C1
set -l nord10 5E81AC
set -l nord11 BF616A
set -l nord12 D08770
set -l nord13 EBCB8B
set -l nord14 A3BE8C
set -l nord15 B48EAD

# Variables used by the default theme.
set -g fish_color_normal $nord6
set -g fish_color_command $nord8
set -g fish_color_quote $nord11
set -g fish_color_redirection $nord11
set -g fish_color_end $nord11
set -g fish_color_error $nord11
set -g fish_color_param $nord5
set -g fish_color_comment $nord3
set -g fish_color_match $nord2 --background=$nord4
set -g fish_color_selection $nord2 --background=$nord4
set -g fish_color_search_match $nord2 --background=$nord4
set -g fish_color_operator $nord9
set -g fish_color_escape $nord11
set -g fish_color_cwd $nord7
set -g fish_color_autosuggestion $nord3
set -g fish_color_user $nord9
set -g fish_color_host $nord9
set -g fish_color_host_remote $nord9
set -g fish_color_cancel -r
set -g fish_pager_color_progress normal --background=$nord7
set -g fish_pager_color_background normal
set -g fish_pager_color_prefix normal --bold --underline
set -g fish_pager_color_completion $nord3
set -g fish_pager_color_description $nord0 --background=$nord6

# Additional variables used by the default theme.
set -g fish_color_history_current --bold
set -g fish_color_cwd_root $nord7 --bold
set -g fish_color_valid_path --underline

# Additional variables used by custom themes
set -g fish_color_text_on_light $nord0
set -g fish_color_text_on_dark $nord6
set -g fish_color_git_dirty_bg $nord9
set -g fish_color_git_bg $nord3

function fish_prompt --description "A theme originally based on joelwanner/theme-boxfish."
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
