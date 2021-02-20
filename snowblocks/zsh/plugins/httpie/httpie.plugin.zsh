# Standartized way to get the plugin location. It's usage is `${0:h}`.
# See: https://github.com/zdharma/Zsh-100-Commits-Club/blob/master/Zsh-Plugin-Standard.adoc#1-standardized-0-handling
0="${ZERO:-${${0:#$ZSH_ARGZERO}:-${(%):-%N}}}"
0="${${(M)0:#/*}:-$PWD/$0}"

# Adds functions to $fpath.
if [[ $PMSPEC != *f* ]] {
  fpath+=( "${0:h}/functions" )
}

# Handy alias to download a remote file using httpie.
alias download='http --follow --download'
