function nord --description 'Set the Nord color scheme'
    if status --is-interactive
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

        # default color
        set -U fish_color_normal normal

        # commands like echo
        set -U fish_color_command $nord9

        # keywords like if - this falls back on the command color if unset
        set -U fish_color_keyword $nord9

        # quoted text like abc
        set -U fish_color_quote $nord14

        # IO redirections like >/dev/null
        set -U fish_color_redirection $nord15

        # process separators like; and &
        set -U fish_color_end $nord8

        # syntax errors
        set -U fish_color_error $nord13

        # ordinary command parameters
        set -U fish_color_param $nord6

        # options starting with “-”, up to the first “--” parameter
        set -U fish_color_option $nord6

        # comments like ‘# important’
        set -U fish_color_comment $nord3

        # selected text in vi visual mode
        set -U fish_color_selection white --bold --background=brblack

        # parameter expansion operators like * and ~
        set -U fish_color_operator $nord9

        # character escapes like \n and \x70
        set -U fish_color_escape $nord13

        # autosuggestions (the proposed rest of a command)
        set -U fish_color_autosuggestion $nord1

        # the current working directory in the default prompt
        set -U fish_color_cwd green

        # the username in the default prompt
        set -U fish_color_user brgreen

        # the hostname in the default prompt
        set -U fish_color_host normal

        # the hostname in the default prompt for remote sessions (like ssh)
        set -U fish_color_host_remote normal

        # the ‘^C’ indicator on a canceled command
        set -U fish_color_cancel -r

        # history search matches and selected pager items (background only)
        set -U fish_color_search_match bryellow --background=brblack # todo

        # the progress bar at the bottom left corner
        set -U fish_pager_color_progress brwhite --background=cyan

        # the prefix string, i.e. the string that is to be completed
        set -U fish_pager_color_prefix normal --bold --underline

        # the completion itself, i.e. the proposed rest of the string
        set -U fish_pager_color_completion normal

        # the completion description
        set -U fish_pager_color_description $nord13 yellow

        # background of the selected completion
        set -U fish_pager_color_selected_background --background=brblack
    end
end
