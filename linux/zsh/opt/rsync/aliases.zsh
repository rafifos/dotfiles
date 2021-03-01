# rsync based file system operations with detailed process and status information.
alias cpr='rsync --archive --executability -hh --partial --info=name2 --info=progress2 --info=stats1 --modify-window=1'
alias mvr='cpr --remove-source-files'
