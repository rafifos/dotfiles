function fish_user_key_bindings --description "User key bindings"
    bind ! _bind_bang
    bind '$' _bind_dollar
    bind '$$' _bind_self
    bind '$?' _bind_status
    bind \cs 'commandline "sudo $history[1]"'
end
