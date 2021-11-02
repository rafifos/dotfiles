function ls --wraps ls --wraps exa --description "Replaces ls(1) with exa(1)"
    if type -q exa
        # See https://the.exa.website/docs/command-line-options for full list of command-line options.
        set -l exa_args --
        set -a exa_args --oneline
        set -a exa_args --long
        set -a exa_args --classify
        set -a exa_args --all
        set -a exa_args --group-directories-first
        set -a exa_args --header
        set -a exa_args --time-style=iso
        set -a exa_args --extended
        set -a exa_args --git

        exa (string split ' ' $exa_args $argv)
    else
        # Enable colorized long listing with human-readable sizes and ISO-8601 date formats.
        # The time style is inherited from the TIME_STYLE environment variable.
        ls -AGgh --color=auto --group-directories-first --time-style="+" "$argv"
    end
end
