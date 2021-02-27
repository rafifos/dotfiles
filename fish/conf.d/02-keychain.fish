if type -q keychain
    set -l __keychain_agents
    set -l __keychain_file ~/.keychain/$HOSTNAME-fish
    set -l __keychain_gpg_file ~/.keychain/$HOSTNAME-fish-gpg
    set -l __keychain_identities
    set -l __keychain_optional_params

    # Don't ask for passwords on non-interactive shells.
    not status --is-interactive; and set -a __keychain_optional_params --noask

    if type -q gpg
        test $HOSTNAME = GUARDIAN; and set -a __keychain_identities B95B60CE
        test $HOSTNAME = drifter; and set -a __keychain_identities 080131B7

        # Support for gpg-agent in keychain isn't idempotent.
        if pgrep -x gpg-agent >/dev/null; and test -f $__keychain_gpg_file
            source $__keychain_gpg_file
        else if not test -f $__keychain_gpg_file
            set -a __keychain_agents gpg
        end
    end

    if type -q ssh
        test -f ~/.ssh/id_ed25519; and set -a __keychain_identities id_ed25519
        test -f ~/.ssh/id_rsa; and set -a __keychain_identities id_rsa

        set -a __keychain_agents ssh
    end

    test -n "$__keychain_agents"; and keychain --quick --inherit any $__keychain_optional_params --agents (string join ',' $__keychain_agents) $__keychain_identities | source
    test -f $__keychain_file; and source $__keychain_file
end
