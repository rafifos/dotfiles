# Private data.
test -f "$__fish_user_config_dir"/private.fish; and source "$__fish_user_config_dir"/private.fish

# asdf-vm setup.
# See: https://asdf-vm.com/#/core-manage-asdf?id=install
if not test -d ~/.asdf
    git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.8.0

    not test -d ~/.config/fish/completions; and mkdir -p ~/.config/fish/completions
    ln -s ~/.asdf/completions/asdf.fish ~/.config/fish/completions

    source ~/.asdf/asdf.fish

    asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git
    replay 'bash -c \'${ASDF_DATA_DIR:=$HOME/.asdf}/plugins/nodejs/bin/import-release-team-keyring\''

    # asdf-nodejs default packages, I know this is ugly, blame fish for it.
    echo >~/.default-npm-packages npm
    echo >>~/.default-npm-packages npq
    echo >>~/.default-npm-packages terser
    echo >>~/.default-npm-packages tldr
    echo >>~/.default-npm-packages yarn

    echo >~/.asdfrc 'legacy_version_file = yes'

    asdf install nodejs lts
    asdf global nodejs lts
else
    source ~/.asdf/asdf.fish
end

if status --is-interactive
    # Loads the GNOME Keyring daemon if it isn't running.
    if type -q gnome-keyring-daemon; and test -n "$DESKTOP_SESSION"
        set -gx (gnome-keyring-daemon --start | string split "=")
    end

    # Add "safety net" for basic but irreversible file system operations by using
    # verbose and interactive command modes.
    abbr -a -g cp 'cp -vi'
    abbr -a -g mv 'mv -vi'
    abbr -a -g rm 'rm -vi'

    # Enable colorized long listing with human-readable size- and ISO-8601 date formats.
    # The time style is inherited from the TIME_STYLE environment variable.
    alias ls 'ls -AGgh --color=auto --group-directories-first --time-style="+"'
    abbr -a -g ll 'ls -l'
    abbr -a -g l ls

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

    if type -q exa
        # Provides a simple and accesible alias for directory listing.
        alias exa 'exa -aF --git --group-directories-first'

        # Shows directories in a list instead of a grid.
        abbr -a -g ee 'exa -1'

        # Shows directories in a tree instead of a grid.
        abbr -a -g et 'exa -TL 1'

        # Makes exa extra-verbose by default.
        abbr -a -g e 'exa -@aghl'
    end

    # Handy abbr to download a remote file using httpie.
    type -q http; and abbr -a -g download 'http --follow --download'

    # Hooks npq to npm and yarn.
    # See: https://github.com/lirantal/npq#embed-in-your-day-to-day
    type -q npm; and alias npm npq-hero
    type -q yarn; and alias yarn "NPQ_PKG_MGR=yarn npq-hero"

    # Prints some info about TARGET before prompting for action.
    type -q rip; and abbr -a -g rip 'rip --inspect'

    # rsync aliases
    if type -q rsync
        # rsync based file system operations with detailed process and status information.
        alias cpr 'rsync --archive --executability -hh --partial --info=name2 --info=progress2 --info=stats1 --modify-window=1'
        alias mvr 'cpr --remove-source-files'
    end
end
