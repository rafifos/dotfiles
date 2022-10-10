function _bind_self --description 'Enables the usage of the $$ expansion present on Bash'
    commandline -i (echo '$fish_pid')
end
