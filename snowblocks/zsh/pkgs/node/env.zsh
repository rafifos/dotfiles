# Copyright (c) 2021 Rafael Julio <hello@rafifos.dev>
#
# Project:    dotfiles
# Repository: https://github.com/rafifos/dotfiles
# License:    MIT License

# Configuration for the Node Version Manager.
# See:
#   1. https://github.com/nvm-sh/nvm#environment-variables
export NVM_DIR=$PATH_USER_CONFIG/nvm
export NVM_BIN=$PATH_USER_BIN

# Configuration for Node.js.
# See:
#   1. https://nodejs.org/api/cli.html#cli_environment_variables
export NODE_ENV=production
export NODE_PENDING_DEPRECATION=1
export NODE_PRESERVE_SYMLINKS=1
export NODE_OPTIONS="--max-old-space-size=4096"
