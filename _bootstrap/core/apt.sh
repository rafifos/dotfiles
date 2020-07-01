#!/usr/bin/env bash
# shellcheck disable=SC2128,SC2155
#
# Enables repository and package management through apt.
# See: http://manpages.ubuntu.com/manpages/focal/man8/apt.8.html
#
__apt::add-key() {
  if [[ ! "$(__utils::check_command curl)" ]]; then
    __bootstrap::log_error "curl is not installed, exiting"
    exit 1
  fi
  
  __bootstrap::log_info "Will add the following keys to apt: $*"
  __utils::warn_elevation

  local key

  # shellcheck disable=SC2048
  for key in $*; do
    curl -fsSL "$key" | sudo apt-key add -
  done

  sudo apt update

  __utils::pause_and_clear
}

__apt::add-repository() {
  __bootstrap::log_info "Will add the following repositories to apt: $*"
  __utils::warn_elevation

  local repository

  # shellcheck disable=SC2048
  for repository in $*; do
    sudo add-apt-repository "$repository"
  done

  __utils::pause_and_clear
}

__apt::install() {
  __bootstrap::log_info "Will install the following packages using apt: $*"
  __utils::warn_elevation

  local package

  # shellcheck disable=SC2048
  for package in $*; do
    sudo apt install "$package"
  done

  __utils::pause_and_clear
}
