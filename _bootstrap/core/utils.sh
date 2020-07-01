#!/usr/bin/env bash
# shellcheck disable=SC2128,SC2155
#
# Common utilities
#
__utils::warn_elevation() {
  __bootstrap::log_warn "This operation requires elevation, you've been warned"
}

__utils::check_command() {
  if hash "$0" 2>/dev/null; then
    return 0
  else
    return 1
  fi
}

__utils::pause_and_clear() {
  read -rsp $'Press any key to continue...\n' -n 1
  clear
}
