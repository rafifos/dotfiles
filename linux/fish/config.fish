# Private data.
source $__fish_user_config_dir/private.fish

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
end

# Makes the shell aware of asdf's existence.
source ~/.asdf/asdf.fish

if status --is-interactive
    # An arctic, north-bluish clean and elegant dircolors theme.
    eval (dircolors -c $__fish_user_config_dir/lib/nord-dircolors/src/dir_colors)

    # Load the VTE shell profile configuration to enable inheritance of the current working directory
    # when opening a new terminal tab or splitting the current one.
    # The script is necessary since some Linux distributions like Arch Linux only execute scripts in
    # `/etc/profile.d` for login shells while not for non-login based shells which results in the state
    # that the current directory is nve reported by VTE. This means when splitting terminals in Tilix
    # instead of inheriting the directory from the current terminal the split terminal always opens in
    # the home path of the current user.
    # See: https://gnunn1.github.io/tilix-web/manual/vteconfig
    if test -n $TILIX_ID; or test -n $VTE_VERSION; and test -f /etc/profile.d/vte.sh
        replay 'source /etc/profile.d/vte.sh'
    end

    # Workaround for handling TERM variable in multiple tmux sessions properly.
    # See: http://sourceforge.net/p/tmux/mailman/message/32751663
    if test -n $TMUX; and type -q tmux
        switch (tmux showenv TERM 2>/dev/null)
            case '*256color'
                set -g TERM screen-256color
            case '*'
                set -g TERM screen
        end

        tmux attach -t TMUX; or tmux new -s TMUX
    end

    # Use the ncurses-based pinentry program for interactive shells.
    set -gx GPG_TTY (tty)

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

    # Provides a simple and accesible alias for directory listing.
    alias exa 'exa -aF --git --group-directories-first'

    # Shows directories in a list instead of a grid.
    abbr -a -g ee 'exa -1'

    # Shows directories in a tree instead of a grid.
    abbr -a -g et 'exa -TL 1'

    # Makes exa extra-verbose by default.
    abbr -a -g e 'exa -@aghl'

    # Handy abbr to download a remote file using httpie.
    abbr -a -g download 'http --follow --download'

    # Hooks npq to npm and yarn.
    # See: https://github.com/lirantal/npq#embed-in-your-day-to-day
    alias npm npq-hero
    alias yarn "NPQ_PKG_MGR=yarn npq-hero"

    # Prints some info about TARGET before prompting for action.
    abbr -a -g rip 'rip --inspect'

    # rsync based file system operations with detailed process and status information.
    alias cpr 'rsync --archive --executability -hh --partial --info=name2 --info=progress2 --info=stats1 --modify-window=1'
    alias mvr 'cpr --remove-source-files'
end
