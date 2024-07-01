# Set's the output of various programs to use the ISO 8601 format.
# See: https://www.gnu.org/software/coreutils/manual/html_node/Formatting-file-timestamps.html
set -Ux TIME_STYLE iso

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

# Loads Homebrew if it's available.
test -d ~/.linuxbrew; and eval (~/.linuxbrew/bin/brew shellenv)
test -d /home/linuxbrew/.linuxbrew; and eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)

# Prepends local binary directory if it's present.
test -d ~/.local/bin; and fish_add_path ~/.local/bin

# Environment variables for interactive shells.
if status --is-interactive
    # Set the path to the UNIX socket used by ssh to communicate with 1Password.
    # See:
    #   1. ssh(1)
    #   2. https://developer.1password.com/docs/ssh/get-started#step-4-configure-your-ssh-or-git-client
    set -gx SSH_AUTH_SOCK ~/.1password/agent.sock

    # Sets the default pager to less with some options.
    set -gx PAGER 'less --RAW-CONTROL-CHARS --quit-if-one-screen --no-init --quit-on-intr --chop-long-lines 2'

    # Configures the catppuccin theme.
    fish_config theme save "Catppuccin Frappe"

    # Configures the Pure prompt.
    # See: https://pure-fish.github.io/pure/
    set -U pure_symbol_prompt '❯❮❯'

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
end
