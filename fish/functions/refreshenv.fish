function refreshenv --description "Resets the environment (by deleting $__fish_user_config_dir/fish_variables)."
    test -f $__fish_user_config_dir/fish_variables; and rm $__fish_user_config_dir/fish_variables; and echo 'Done.'
end
