# Standartized way to get the file location. It's usage is `${0:h}`.
# See: https://github.com/zdharma/Zsh-100-Commits-Club/blob/master/Zsh-Plugin-Standard.adoc#1-standardized-0-handling
0="${ZERO:-${${0:#$ZSH_ARGZERO}:-${(%):-%N}}}"
0="${${(M)0:#/*}:-$PWD/$0}"

# Unsets all functions (even self) in this directory.
unset -f "${0:h}/*(.)"

# Removes the current directory from $fpath.
fpath=( ${(@)fpath:#${PWD}} )

# Cleanups on plugin unload.
unalias dotfiles
unalias wd
