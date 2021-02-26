function fish_greeting --description "Prints basic system information from time to time, and displays a random based using fortune."
    set -l greeting_shown $HOME/.greeting_shown

    # The logic is based on motd, only show if the file exists and it's older than 7 days.
    if not test -f $greeting_shown
        touch $greeting_shown
    else
        set -l file_lifetime_max (date -d 'now - 7 days' +%s)
        set -l file_time (date -r "$greeting_shown" +%s)

        if test $file_time -gt $file_lifetime_max
            return 0
        else
            rm $greeting_shown
        end
    end

    set -l term_width (tput cols) - 1
    set -q WSLENV; and set -l is_wsl true
    test $WSL_DISTRO_NAME = WLinux; and set -l is_pengwin true

    # WSL specific information.
    if test is_wsl
        # Prints basic system information if running on Pengwin.
        if test is_pengwin
            # Fish doesn't seem to be handling the WSL2 variable well.
            set -q WSL2; or set -q WSL_INTEROP; and set -lx WSL2 1

            # Prints basic system information.
            test -f /etc/update-motd.d/40-environment && bash -c 'source /etc/update-motd.d/40-environment'

            # 40-environment has 1-space indentation. fortune should be width - indentation.
            set term_width "$term_width - 1"
        end
    end

    # Shows a fortune shorter than the screen widthe
    if type -q fortune
        printf "\n+------------------------------------------+\n"
        printf "\nHere's what the %s has to say:" (set_color -i)"Magic Conch shell"(set_color normal)
        printf "\n> %s\n" (fortune -a -n $term_width -s)
        echo
    end
end
