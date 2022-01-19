# Private data.
test -f "$__fish_user_config_dir"/private.fish; and source "$__fish_user_config_dir"/private.fish

if status --is-interactive
    # Loads the GNOME Keyring daemon if it isn't running.
    if type -q gnome-keyring-daemon; and test -n "$DESKTOP_SESSION"
        set -Ux (gnome-keyring-daemon --start | string split "=")
    end

    # Add "safety net" for basic but irreversible file system operations by using
    # verbose and interactive command modes.
    abbr -a -g cp 'cp -vi'
    abbr -a -g mv 'mv -vi'

    # Print permission bits in octal (%a) and file type in human readable form (%A)
    # and quote file name with dereference for symbolic links (%N).
    abbr -a -g lsp 'stat -c "%A %a %N"'

    # Output NUM (3) lines of unified context.
    abbr -a -g diff 'diff -U'

    # Colorizes output and enables line numbers.
    abbr -a -g grep 'grep --color=auto --line-number'
    abbr -a -g egrep 'egrep --color=auto --line-number'
    abbr -a -g fgrep 'gfrep --color=auto --line-number'

    # Colorizes output.
    abbr -a -g ip 'ip --color=auto'

    # Shortcut to ~/.dotfiles
    abbr -a -g dot 'cd ~/.dotfiles'

    # Handy abbr to download a remote file using httpie.
    type -q http; and abbr -a -g download 'http --follow --download'

    # Hooks npq to npm and yarn.
    # See: https://github.com/lirantal/npq#embed-in-your-day-to-day
    type -q npm; and alias npm npq-hero
    type -q pnpm; and alias pnpm "NPQ_PKG_MGR=pnpm npq-hero"
    type -q yarn; and alias yarn "NPQ_PKG_MGR=yarn npq-hero"
end
