# Makes Linuxbrew available to the shell.
test -d $HOME/.linuxbrew && eval $($HOME/.linuxbrew/bin/brew shellenv)
test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
