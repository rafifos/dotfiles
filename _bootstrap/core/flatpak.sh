#!/usr/bin/env bash
# shellcheck disable=SC2128,SC2155
#
# Enables repository and package management through Flatpak.
# See: https://flatpak.org/
#
__flatpak::remote-add() {
  __utils::check_command flatpak

  flatpak remote-add --user --if-not-exists "$0" "$1"

  __utils::pause_and_clear
}

__flatpak::install() {
  __utils::check_command flatpak

  __bootstrap::log_info "Will add the following applications via Flatpak: $*"
  __utils::warn_elevation

  local application

  # shellcheck disable=SC2048
  for application in $*; do
    flatpak install --user flathub "$application"
  done

  __utils::pause_and_clear
}
