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
    echo 'terser'
  } >$NVM_DIR/default-packages

  nvm install --lts
fi

# nvm itself doesn't provide native Zsh completions, instead it uses bashcompinit.
# Be aware of this.
# See:
#   1. https://github.com/nvm-sh/nvm/blob/0fad5ec5755c0519ff30182b69761c84abca9f2b/bash_completion#L83
fpath=($NVM_DIR $fpath)

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Setups the shell for the first time use.
load_nvmrc
