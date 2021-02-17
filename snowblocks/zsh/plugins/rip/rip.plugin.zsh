# Standartized way to get the plugin location. It's usage is `${0:h}`.
# See: https://github.com/zdharma/Zsh-100-Commits-Club/blob/master/Zsh-Plugin-Standard.adoc#1-standardized-0-handling
0="${ZERO:-${${0:#$ZSH_ARGZERO}:-${(%):-%N}}}"
0="${${(M)0:#/*}:-$PWD/$0}"

# Adds the functions directory to $fpath if this isn't handled automatically by the plugin manager.
if [[ $PMSPEC != *f* ]] {
  fpath+=( "${0:h}/functions" )
}

# Directory to which files get sent to, it defaults to a value set by the
# --graveyard file, if it isn't set, then it uses this environment variable
# or the XDG_DATA_HOME environment variable.
# If none o those are set, then it fall backs to /tmp/graveyard-$USER.
# See: https://github.com/nivekuil/rip/blob/master/src/main.rs#L108
export GRAVEYARD="$XDG_CACHE_HOME/graveyard"

# Prints some info about TARGET before prompting for action.
alias rip='rip --inspect'
