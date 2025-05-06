# Private data.
test -f "$__fish_user_config_dir"/private.fish; and source "$__fish_user_config_dir"/private.fish

if status --is-interactive
    # Add "safety net" for basic but irreversible file system operations by using
    # verbose and interactive command modes.
    abbr -a -g cp 'cp -vi'
    abbr -a -g mv 'mv -vi'
    abbr -a -g rm 'rm -vi'

    # Prints some info about TARGET before prompting for action.
    abbr -a -g rip 'rip --inspect'

    # Shortcut to chezmoi's directory
    abbr -a -g dot "cd ~/.local/share/chezmoi"

    # Handy abbr to download a remote file using httpie.
    type -q http; and abbr -a -g download 'http --follow --download'

    # Hooks npq to npm and yarn.
    # See: https://github.com/lirantal/npq#embed-in-your-day-to-day
    type -q npm; and alias npm npq-hero
    type -q pnpm; and alias pnpm "NPQ_PKG_MGR=pnpm npq-hero"
    type -q yarn; and alias yarn "NPQ_PKG_MGR=yarn npq-hero"

    # Rebuilds bat's cache if it doesn't exist.
    if type -q bat
        if not test -e ~/.cache/bat
            bat cache --build
        end
    end

    # Generates delta's completions if they don't exist.
    if type -q delta
        not test -d $__fish_user_data_dir/generated_completions; and mkdir -p $__fish_user_data_dir/generated_completions

        if not test -f $__fish_user_data_dir/generated_completions/delta.fish
            delta --generate-completion fish >$__fish_user_data_dir/generated_completions/delta.fish
        end
    end

    # Initializes fzf.
    type -q fzf; and fzf --fish | source

    # Initializes atuin.
    type -q atuin; and atuin init fish | source

    # Initializes zoxide.
    type -q zoxide; and zoxide init --cmd cd fish | source
end
