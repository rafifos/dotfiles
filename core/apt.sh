#!/usr/bin/env bash
# shellcheck disable=SC2128,SC2155
#
# Enables repository and package management through apt.
# See: http://manpages.ubuntu.com/manpages/focal/man8/apt.8.html
#
__apt::add-repository() {
  __utils::check_command apt

  if [ "$?" -eq 1 ]; then
    __bootstrap::log_error "[$FUNCNAME] apt is not installed"
    exit 1
  elif [ "$#" -eq 0 ]; then
    __bootstrap::log_error "[$FUNCNAME] Missing parameter while calling function $FUNCNAME"
    exit 1
  else
    __bootstrap::log_warn "[$FUNCNAME] This operation requires elevation, you've been warned"
    sudo add-apt-repository "$0"
    sudo apt update
  fi
}

__apt::install() {
  __utils::check_command apt

  if [ "$?" -eq 1 ]; then
    __bootstrap::log_error "[$FUNCNAME] apt is not installed"
    exit 1
  elif [ "$#" -eq 0 ]; then
    __bootstrap::log_error "[$FUNCNAME] Missing parameter while calling function $FUNCNAME"
    exit 1
  else
    __bootstrap::log_warn "[$FUNCNAME] This operation requires elevation, you've been warned"
    
    local package

    # shellcheck disable=SC2048
    for package in $*; do
      __bootstrap::log_info "[$FUNCNAME] Installing apt package $package"
      sudo apt install --assume-yes "$package"
    done
  fi
}
