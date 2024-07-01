function eza --wraps eza
    set -l default_args "--oneline"
    set -a default_args "--long"
    set -a default_args "--hyperlink"
    set -a default_args "--all"
    set -a default_args "--group-directories-first"
    set -a default_args "--group"
    set -a default_args "--header"
    set -a default_args "--mounts"
    set -a default_args "--git"
    set -a default_args "--git-repos"
    set -a default_args "--time-style=long-iso"
    set -a default_args "--no-permissions"
    set -a default_args "--octal-permissions"

    if test (count $argv) -eq 0
        command eza $default_args
    else
        command eza $argv
    end
end
