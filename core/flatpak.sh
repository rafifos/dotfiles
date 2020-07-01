#!/usr/bin/env bash
# shellcheck disable=SC2128,SC2155
#
# Enables repository and package management through Flatpak.
# See: https://flatpak.org/
#
__flatpak::remote-add() {
  __utils::check_command flatpak

  flatpak remote-add --user --if-not-exists "$0" "$1"
}

__flatpak::install() {
  __utils::check_command flatpak

  flatpak install --user "$0" "$1"
}
