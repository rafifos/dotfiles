#!/usr/bin/env bash
# shellcheck disable=SC2128,SC2155
#
# Manages the local homemaker binary.
#
__homemaker::install() {
  local __url='https://foosoft.net/projects/homemaker/dl/homemaker_linux_amd64.tar.gz'

  __bootstrap::log_info "[$FUNCNAME] Downloading and installing homemaker"

  if [ "$(wget --quiet "$__url" --output-document - | tar --extract --gzip)" ]; then
    mv homemaker_linux_amd64/homemaker homemaker
    rm -rf homemaker_linux_amd64/
    chmod +x ./homemaker

    return 0
  else
    __bootstrap::log_error "[$FUNCNAME] Failed to install homemaker"
    exit 1
  fi
}
