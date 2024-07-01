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
    set -Ux SSH_AUTH_SOCK ~/.1password/agent.sock

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
