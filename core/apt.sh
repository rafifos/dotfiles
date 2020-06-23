#!/usr/bin/env bash
# shellcheck disable=SC2128,SC2155
#
# Enables repository and package management through apt.
# See: http://manpages.ubuntu.com/manpages/focal/man8/apt.8.html
#
__apt::add-repository() {
  local __self_name="$(__bootstrap::get_module_name)"

  __utils::check_command apt

  if [ "$?" -eq 1 ]; then
    __bootstrap::log_error "[$__self_name] apt is not installed"
    exit 1
  elif [ "$#" -eq 0 ]; then
    __bootstrap::log_error "[$__self_name] Missing parameter while calling function $FUNCNAME"
    exit 1
  else
    __bootstrap::log_warn "[$__self_name] This operation requires elevation, you've been warned"
    sudo add-apt-repository "$0"
    sudo apt update
  fi
}

__apt::install() {
  local __self_name="$(__bootstrap::get_module_name)"

  __utils::check_command apt

  if [ "$?" -eq 1 ]; then
    __bootstrap::log_error "[$__self_name] apt is not installed"
    exit 1
  elif [ "$#" -eq 0 ]; then
    __bootstrap::log_error "[$__self_name] Missing parameter while calling function $FUNCNAME"
    exit 1
  else
    __bootstrap::log_warn "[$__self_name] This operation requires elevation, you've been warned"
    
    local package

    # shellcheck disable=SC2048
    for package in $*; do
      __bootstrap::log_info "[$__self_name] Installing apt package $package"
      sudo apt install --assume-yes "$package"
    done
  fi
}
