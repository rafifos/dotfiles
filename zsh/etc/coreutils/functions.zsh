#;
# mkd()
# Creates a new directory and directly changes into it.
# @param name: The name of the new directory
# @notes This function is defined next to the user aliases because it's pretty much an alias.
#"
function mkd() {
  mkdir -p "$@" && cd "${@:$#}"
}
