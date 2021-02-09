# Copyright (c) 2021 Rafael Julio <development@rafifos.dev>

# Project:    dotfiles
# Repository: https://github.com/rafifos/dotfiles
# License:    MIT License

# Directory to which files get sent to, it defaults to a value set by the
# --graveyard file, if it isn't set, then it uses this environment variable
# or the XDG_DATA_HOME environment variable.
# If none o those are set, then it fall backs to /tmp/graveyard-$USER.
# See:
#   1. https://github.com/nivekuil/rip/blob/master/src/main.rs#L108
export GRAVEYARD=$PATH_USER_CACHE/graveyard
