#!/usr/bin/env bash
# shellcheck disable=SC2128,SC2155
#
# Enables repository and package management through apt.
# See: http://manpages.ubuntu.com/manpages/focal/man8/apt.8.html
#
__apt::add-repository() {
  __utils::check_command apt
  __utils::warn_elevation

  local repository

  # shellcheck disable=SC2048
  for repository in $*; do
    __bootstrap::log_info "Adding apt repository $repository"
    sudo add-apt-repository "$repository"
    sudo apt update
  done
}

__apt::install() {
  __utils::check_command apt
  __utils::warn_elevation

  local package

  # shellcheck disable=SC2048
  for package in $*; do
    __bootstrap::log_info "Installing apt package $package"
    sudo apt install "$package"
  done
}
