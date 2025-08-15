if test (uname) = Linux
    # Sets the XDG Base Directory Specification directories.
    # See: https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
    set -Ux XDG_CACHE_HOME $HOME/.cache
    set -Ux XDG_CONFIG_HOME $HOME/.config
    set -Ux XDG_RUNTIME_DIR $HOME/.local/run
    set -Ux XDG_STATE_HOME $HOME/.local/state
    set -Ux XDG_DATA_HOME $HOME/.local/share

    # Also appends the applicable directories to XDG_CONFIG_DIRS and XDG_DATA_DIRS.
    set -Ua XDG_CONFIG_DIRS $XDG_CONFIG_HOME
    set -Ua XDG_DATA_DIRS $XDG_DATA_HOME

    # Sets fish's config and data directories.
    set -U __fish_user_data_dir $XDG_DATA_HOME/fish
    set -U __fish_user_config_dir $XDG_CONFIG_HOME/fish

    # Fixes ssh commands on WSL
    alias ssh 'ssh.exe'
    alias ssh-add 'ssh-add.exe'
end

# Set's the output of various programs to use the ISO 8601 format.
# See: https://www.gnu.org/software/coreutils/manual/html_node/Formatting-file-timestamps.html
set -Ux TIME_STYLE iso

# Loads Homebrew if it's available.
test -d ~/.linuxbrew; and eval (~/.linuxbrew/bin/brew shellenv)
test -d /home/linuxbrew/.linuxbrew; and eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
test -d /opt/homebrew; and eval (/opt/homebrew/bin/brew shellenv)

# Prepends local binary directory if it's present.
test -d ~/.local/bin; and fish_add_path ~/.local/bin

# Configure pinentry to use the correct TTY.
# See: https://wiki.archlinux.org/title/GnuPG#:~:text=gpg-agent%20%5B3%5D.-,Configure%20pinentry%20to%20use%20the%20correct%20TTY,-Also%20set%20the
set -gx GPG_TTY (tty)

# Launches gpg-agent if it's not already running.
gpgconf --launch gpg-agent

# Uses Homebrew's OpenSSL when compiling.
# See: https://mise.jdx.dev/lang/python.html#troubleshooting-errors-with-homebrew
set -Ux CFLAGS "-I$(brew --prefix openssl)/include"
set -Ux CXXFLAGS "-I$(brew --prefix openssl)/include"
set -Ux LDFLAGS "-L$(brew --prefix openssl)/lib"

# Builds Python with optimizations and link-time optimizations (LTO).
# See: https://github.com/pyenv/pyenv/tree/master/plugins/python-build#building-for-maximum-performance
set -Ux PYTHON_CONFIGURE_OPTS '--enable-optimizations --with-lto'
set -Ux PYTHON_CFLAGS '-march=native -mtune=native'

# Environment variables for interactive shells.
if status --is-interactive
    # Sets the default pager to less with some options.
    set -gx PAGER 'less --RAW-CONTROL-CHARS --quit-if-one-screen --no-init --quit-on-intr --chop-long-lines'

    # Configures the catppuccin theme.
    # fish_config theme save "Catppuccin Frappe"

    # Configures the Pure prompt.
    # See: https://pure-fish.github.io/pure/
    set -U pure_symbol_prompt '><>'

    # Sets helix as the default editor if it's installed.
    if type -q hx
        set -gx EDITOR hx
    end

    # Configures fd as the default command for fzf.
    if type -q fd
        # Follows symlinks and hidden files, but excludes the .git directory, with colored output.
        set -gx FZF_DEFAULT_COMMAND 'fd --type file --color=always --follow --hidden --exclude .git --strip-cwd-prefix'
        set -gx FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND
        set -gx FZF_DEFAULT_OPTS --ansi
    end

    if test (uname) = Darwin
        # Prepends uutils-coreutils to the PATH.
        # See: https://formulae.brew.sh/formula/uutils-coreutils
        fish_add_path --prepend (brew --prefix uutils-coreutils)/libexec/uubin

        # Prepends uutils-findutils to the PATH.
        # See: https://formulae.brew.sh/formula/uutils-findutils
        fish_add_path --prepend (brew --prefix uutils-findutils)/libexec/uubin

        # Prepends uutils-diffutils to the PATH.
        # See: https://formulae.brew.sh/formula/uutils-diffutils
        fish_add_path --prepend (brew --prefix uutils-diffutils)/libexec/uubin
    end
end
