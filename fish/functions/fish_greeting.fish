function fish_greeting --description "Prints basic system information from time to time."
    set -l __greeting_shown $__fish_user_data_dir/greeting_shown

    # The logic is based on motd, only show if the file exists and it's older than 7 days.
    if not test -f $__greeting_shown
        touch $__greeting_shown
    else
        set -l file_time_max (date -d 'now - 7 days' +%s)
        set -l file_time (date -r "$__greeting_shown" +%s)

        if test $file_time -gt $file_time_max
            # File is newer than 7 days, don't show anything.
            return 0
        else
            rm $__greeting_shown
        end
    end

    # WSL specific information.
    if test -n WSLENV
        # Prints basic system information if running on Pengwin.
        if test -n WSL_DISTRO_NAME; and test WSL_DISTRO_NAME = WLinux
            # Fish doesn't seem to be handling the WSL2 variable well.
            set -q WSL2; or set -q WSL_INTEROP; and set -lx WSL2 1

            # Prints basic system information.
            test -f /etc/update-motd.d/40-environment && bash -c 'source /etc/environment; source /etc/update-motd.d/40-environment'

            # Because of the '+' character, we need to subtract 2 from the terminal width.
            set -l __term_separator \n+(printf "%*s" (math (tput cols) - 2) | sed "s/ /-/g")+\n
            echo "$__term_separator"
        end
    end

    # What does the Magic Conch shell has to say?
    magic_conch_shell
end
