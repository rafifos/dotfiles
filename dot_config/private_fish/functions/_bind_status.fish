function _bind_status --description 'Enables the usage of the $? expansion present on Bash. See: https://github.com/fish-shell/fish-shell/wiki/Bash-Style-Command-Substitution-and-Chaining-(!!-!$)#getting--and-'
    commandline -i (echo '$status')
end
