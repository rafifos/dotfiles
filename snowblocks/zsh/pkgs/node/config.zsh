# Copyright (c) 2021 Rafael Julio <development@rafifos.dev>

# Project:    dotfiles
# Repository: https://github.com/rafifos/dotfiles
# License:    MIT License

# Installs nvm - The Node Version Manager to the current user if it doens't exists.
if [[ ! -d $NVM_DIR ]]; then
  mkdir -p $NVM_DIR
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash

  {
    echo 'npm'
    echo 'yarn'
  } >$NVM_DIR/default-packages

  nvm install --lts
fi

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

load-nvmrc() {
  local NODE_VERSION="$(nvm version)"
  local NVMRC_PATH="$(nvm_find_nvmrc)"

  if [ -n "$NVMRC_PATH" ]; then
    local NVMRC_NODE_VERSION=$(nvm version "$(cat "${NVMRC_PATH}")")

    if [ "$NVMRC_NODE_VERSION" = "N/A" ]; then
      nvm install
    elif [ "$NVMRC_NODE_VERSION" != "$NODE_VERSION" ]; then
      nvm use
    fi
  elif [ "$NODE_VERSION" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}

add-zsh-hook chpwd load-nvmrc
load-nvmrc
