#!/usr/bin/env bash
# shellcheck disable=SC2155,SC1090
#
# References:
# - https://github.com/arcticicestudio/igloo/blob/ac9f7bf7a3e931ff4825757a428e9c00fbb45543/snowblocks/bash/bootstrap
# - https://misc.flogisoft.com/bash/tip_colors_and_formatting
#
__bootstrap::get_module_realpath() {
  if hash realpath 2>/dev/null; then
    printf "%s" "$(realpath "${BASH_SOURCE[0]}")"
  else
    printf "%s" "$(readlink "${BASH_SOURCE[0]}")"
  fi
}

__bootstrap::get_module_name() {
  printf "%s" "$(basename "$(__bootstrap::get_module_realpath)")"
}

__bootstrap::get_base_dir() {
  printf "%s" "$(dirname "$(__bootstrap::get_module_realpath)")"
}

__bootstrap::log_info() {
  printf "\e[34m[INFO]\e[0m %s\n" "$*"
}

__bootstrap::log_warn() {
  printf "\e[33m[WARN]\e[0m %s\n" "$*"
}

__bootstrap::log_error() {
  printf "\e[31m[ERROR]\e[0m %s\n" "$*" 1>&2
}

__bootstrap::load_core_module() {
  local __self_name="$(__bootstrap::get_module_name)"

  if [ "$#" -eq 0 ]; then
    # shellcheck disable=SC2128
    __bootstrap::log_info "[$__self_name] Missing parameter while calling function $FUNCNAME"
    __bootstrap::log_error "[$__self_name] Error while loading core modules"
    return 1
  fi

  local module

  # shellcheck disable=SC2048,SC2181
  for module in $*; do
    module=$BOOTSTRAP_BASE_DIR/$module.sh

    if [ -f "$module" ]; then
      . "$module"
      if [ $? -eq 0 ]; then
        __bootstrap::log_info "[$__self_name] Core module $(basename "$module") successfully loaded"
      else
        __bootstrap::log_info "[$__self_name] Error while loading core module $(basename "$module")"
      fi
    else
      __bootstrap::log_error "[$__self_name] Core module $(basename "$module") not found"
      return 1
    fi
  done
}

export BOOTSTRAP_BASE_DIR="$(__bootstrap::get_base_dir)"

# +--------------+
# + Core Modules +
# +--------------+
__bootstrap::load_core_module core/utils core/apt core/flatpak

