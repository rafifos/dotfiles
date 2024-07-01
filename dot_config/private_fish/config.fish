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

    # Shortcut to ~/.dotfiles
    abbr -a -g dot 'cd ~/.dotfiles'

    # Handy abbr to download a remote file using httpie.
    type -q http; and abbr -a -g download 'http --follow --download'

    # Hooks npq to npm and yarn.
    # See: https://github.com/lirantal/npq#embed-in-your-day-to-day
    type -q npm; and alias npm npq-hero
    type -q pnpm; and alias pnpm "NPQ_PKG_MGR=pnpm npq-hero"
    type -q yarn; and alias yarn "NPQ_PKG_MGR=yarn npq-hero"

    # Generates delta's completions if they don't exist.
    if type -q delta
        if not test -f $__fish_user_data_dir/generated_completions/delta.fish
            delta --generate-completion fish > $__fish_user_data_dir/generated_completions/delta.fish
        end
    end
end
