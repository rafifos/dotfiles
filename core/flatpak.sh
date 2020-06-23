#!/usr/bin/env bash
# shellcheck disable=SC2128,SC2155
#
# Enables repository and package management through Flatpak.
# See: https://flatpak.org/
#
__flatpak::remote-add() {
  local __self_name="$(__bootstrap::get_module_name)"

  __utils::check_command flatpak

  if [ "$?" -eq 1 ]; then
    __bootstrap::log_error "[$__self_name] Flatpak is not installed"
    exit 1
  elif [ "$#" -eq 0 ] || [ "$#" -eq 1 ]; then
    __bootstrap::log_error "[$__self_name] Missing parameter while calling function $FUNCNAME"
    exit 1
  else
    flatpak remote-add --user --if-not-exists "$0" "$1"
  fi
}

__flatpak::install() {
  local __self_name="$(__bootstrap::get_module_name)"

  __utils::check_command flatpak

  if [ "$?" -eq 1 ]; then
    __bootstrap::log_error "[$__self_name] Flatpak is not installed"
    exit 1
  elif [ "$#" -eq 0 ] || [ "$#" -eq 1 ]; then
    __bootstrap::log_error "[$__self_name] Missing parameter while calling function $FUNCNAME"
    exit 1
  else
    __bootstrap::log_info "[$__self_name] Installing flatpak package $0 from $1"
    flatpak install --user --assumeyes --noninteractive "$0" "$1"
  fi
}
