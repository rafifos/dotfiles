#!/usr/bin/env bash
# shellcheck disable=SC2128,SC2155
#
# Enables repository and package management through apt.
# See: http://manpages.ubuntu.com/manpages/focal/man8/apt.8.html
#
__apt::add-repository() {
  __utils::check_command apt
  __bootstrap::log_info "Will add the following repositories to apt: $*"
  __utils::warn_elevation

  local repository

  # shellcheck disable=SC2048
  for repository in $*; do
    sudo add-apt-repository "$repository"
    sudo apt update
  done
}

__apt::install() {
  __utils::check_command apt
  __bootstrap::log_info "Will install the following packages using apt: $*"
  __utils::warn_elevation

  local package

  # shellcheck disable=SC2048
  for package in $*; do
    sudo apt install "$package"
  done
}
