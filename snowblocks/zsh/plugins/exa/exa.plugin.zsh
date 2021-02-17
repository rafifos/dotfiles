# Standartized way to get the plugin location. It's usage is `${0:h}`.
# See: https://github.com/zdharma/Zsh-100-Commits-Club/blob/master/Zsh-Plugin-Standard.adoc#1-standardized-0-handling
0="${ZERO:-${${0:#$ZSH_ARGZERO}:-${(%):-%N}}}"
0="${${(M)0:#/*}:-$PWD/$0}"

# Adds functions to $fpath.
if [[ $PMSPEC != *f* ]] {
  fpath+=( "${PWD}/functions" )
}

# Provides a simple and accesible alias for directory listing.
alias e='command exa -aF --git --group-directories-first'

# Shows directories in a list instead of a grid.
alias ee='e -1'

# Shows directories in a tree instead of a grid.
alias et='e -TL 1'

# Makes exa extra-verbose by default.
alias exa='e -@aghl'
