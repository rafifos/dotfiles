#!/usr/bin/env bash
# shellcheck disable=SC2128,SC2155
#
# Common utilities
#
__utils::check_command() {
  local __self_name="$(__bootstrap::get_module_name)"

  if [ "$#" -eq 0 ]; then
    __bootstrap::log_error "[$__self_name] Missing parameter while calling function $FUNCNAME"
  elif hash "$0" 2>/dev/null; then
    return 0
  else
    return 1
  fi
}
