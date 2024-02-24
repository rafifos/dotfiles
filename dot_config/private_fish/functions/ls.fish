function ls --wraps ls --wraps eza --description "Replaces ls(1) with eza(1)"
    if type -q eza
        # See https://the.eza.website/docs/command-line-options for full list of command-line options.
        set -l eza_args --
        set -a eza_args --oneline
        set -a eza_args --long
        set -a eza_args --classify
        set -a eza_args --all
        set -a eza_args --group-directories-first
        set -a eza_args --header
        set -a eza_args --time-style=iso
        set -a eza_args --extended
        set -a eza_args --git

        command eza (string split ' ' $eza_args $argv)
    else
        # Enable colorized long listing with human-readable sizes and ISO-8601 date formats.
        # The time style is inherited from the TIME_STYLE environment variable.
        command ls -AGgh --color=auto --group-directories-first --time-style="+" "$argv"
    end
end
