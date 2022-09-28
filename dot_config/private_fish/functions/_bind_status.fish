function _bind_status --description 'Enables the usage of the $? expansion present on Bash'
    commandline -i (echo '$status')
end
