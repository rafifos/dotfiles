#!/usr/bin/env bash
# shellcheck disable=SC2128,SC2155
#
# Manages the local homemaker binary.
#
__homemaker::install() {
  local url='https://foosoft.net/projects/homemaker/dl/homemaker_linux_amd64.tar.gz'

  __bootstrap::log_info "Downloading and installing homemaker"

  curl -s "$url"  | tar --extract --gzip
  mv homemaker_linux_amd64/homemaker homemaker
  chmod +x ./homemaker
  rm -rf homemaker_linux_amd64/

  if [[ ! -x "$(pwd)/homemaker" ]]; then
    __bootstrap::log_error "Failed to install homemaker"
    exit 1
  fi
}
