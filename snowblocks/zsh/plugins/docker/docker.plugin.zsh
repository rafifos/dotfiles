# Standartized way to get the file location. It's usage is `${0:h}`.
# See: https://github.com/zdharma/Zsh-100-Commits-Club/blob/master/Zsh-Plugin-Standard.adoc#1-standardized-0-handling
0="${ZERO:-${${0:#$ZSH_ARGZERO}:-${(%):-%N}}}"
0="${${(M)0:#/*}:-$PWD/$0}"

# Adds the functions directory to $fpath if this isn't handled automatically by the plugin manager.
if [[ $PMSPEC != *f* ]] {
  fpath+=( "${0:h}/functions" )
}

# Enable new Docker output formatting.
# See: https://docs.docker.com/develop/develop-images/build_enhancements
export DOCKER_BUILDKIT=1
