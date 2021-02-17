# Standartized way to get the plugin location. It's usage is `${0:h}`.
# See: https://github.com/zdharma/Zsh-100-Commits-Club/blob/master/Zsh-Plugin-Standard.adoc#1-standardized-0-handling
0="${ZERO:-${${0:#$ZSH_ARGZERO}:-${(%):-%N}}}"
0="${${(M)0:#/*}:-$PWD/$0}"

# Adds functions to $fpath.
if [[ $PMSPEC != *f* ]] {
  fpath+=( "${PWD}/functions" )
}

# rsync based file system operations with detailed process and status information.
alias cpr='rsync --archive --executability -hh --partial --info=name2 --info=progress2 --info=stats1 --modify-window=1'
alias mvr='cpr --remove-source-files'
