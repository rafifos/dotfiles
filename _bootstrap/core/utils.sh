#!/usr/bin/env bash
# shellcheck disable=SC2128,SC2155
#
# Common utilities
#
__utils::warn_elevation() {
  __bootstrap::log_warn "This operation requires elevation, you've been warned"
}

__utils::check_command_and_exit() {
  if ! hash "$0" 2>/dev/null; then
    __bootstrap::log_error "Command $0 was not found, exiting"
    exit 1
  fi
}

__utils::pause_and_clear() {
  read -rsp $'Press any key to continue...\n' -n 1
  clear
}
