function fish_greeting --description "Prints basic system information from time to time."
    set -l __greeting_shown $HOME/.greeting_shown

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
        end
    end

    # What does the Magic Conch shell has to say?
    magic_conch_shell
end
