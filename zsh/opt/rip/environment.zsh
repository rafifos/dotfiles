# Directory to which files get sent to, it defaults to a value set by the
# --graveyard file, if it isn't set, then it uses this environment variable
# or the XDG_DATA_HOME environment variable.
# If none o those are set, then it fall backs to /tmp/graveyard-$USER.
# @see: https://github.com/nivekuil/rip/blob/master/src/main.rs#L108
export GRAVEYARD=$XDG_CACHE_HOME/graveyard
