# Standartized way to get the plugin location. It's usage is `${0:h}`.
# See: https://github.com/zdharma/Zsh-100-Commits-Club/blob/master/Zsh-Plugin-Standard.adoc#1-standardized-0-handling
0="${ZERO:-${${0:#$ZSH_ARGZERO}:-${(%):-%N}}}"
0="${${(M)0:#/*}:-$PWD/$0}"

# Adds functions to $fpath.
if [[ $PMSPEC != *f* ]] {
  fpath+=( "${PWD}/functions" )
}

# Environment variables for ripgrep.
# See: https://github.com/BurntSushi/ripgrep/blob/master/GUIDE.md#configuration-file
export RIPGREP_CONFIG_PATH="${XDG_CONFIG_HOME:-${HOME}/.config}/ripgrep"
