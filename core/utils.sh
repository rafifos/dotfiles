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
    __bootstrap::log_error "$0 isn't installed, exiting."
    exit 1
  fi
}
