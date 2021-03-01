function fish_greeting --description "Prints basic system information from time to time, and displays a random based using fortune."
    set -l __greeting_shown $HOME/.greeting_shown

    # The logic is based on motd, only show if the file exists and it's older than 7 days.
    if not test -f $__greeting_shown
        touch $__greeting_shown
    else
        set -l file_lifetime_max (date -d 'now - 7 days' +%s)
        set -l file_time (date -r "$__greeting_shown" +%s)

        if test $file_time -gt $file_lifetime_max
            return 0
        else
            rm $__greeting_shown
        end
    end

    set -l __term_width (tput cols)

    # Because of the '+' character, we need to subtract 2 from the terminal width.
    set -l __term_separator +(printf "%*s" (math $__term_width - 2) | sed "s/ /-/g")+

    set -q WSLENV; and set -l is_wsl true
    test $WSL_DISTRO_NAME = WLinux; and set -l is_pengwin true

    # WSL specific information.
    if test is_wsl
        # Prints basic system information if running on Pengwin.
        if test is_pengwin
            # Fish doesn't seem to be handling the WSL2 variable well.
            set -q WSL2; or set -q WSL_INTEROP; and set -lx WSL2 1

            # Prints basic system information.
            test -f /etc/update-motd.d/40-environment && bash -c 'source /etc/environment; source /etc/update-motd.d/40-environment'

            # `/etc/update-motd.d/40-environment` has 1-space indentation. fortune should be width - indentation.
            set __term_width (tput cols) - 1
        end
    end

    # The Magic Conch shell.
    # Source: https://spongebob.fandom.com/wiki/Magic_Conch_shell#Answers
    set -l __magic_conch_answers '"Maybe someday."'
    set -a __magic_conch_answers '"Nothing."'
    set -a __magic_conch_answers '"Neither."'
    set -a __magic_conch_answers '"I don\'t think so."'
    set -a __magic_conch_answers '"No."'
    set -a __magic_conch_answers '"Yes."'
    set -a __magic_conch_answers '"Try asking again."'

    set -l __magic_conch_answer (random choice $__magic_conch_answers)

    printf "\n%s\n" $__term_separator
    printf "\nHere's what the %s has to say:\n" (set_color -i B48EAD)"Magic Conch shell"(set_color normal)
    printf "> %s\n" $__magic_conch_answer
end
