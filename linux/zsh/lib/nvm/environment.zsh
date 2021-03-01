# zsh-nvm options.
# @see: https://github.com/lukechilds/zsh-nvm#options
export NVM_DIR=$XDG_DATA_HOME/nvm
export NVM_COMPLETION=true
export NVM_LAZY_LOAD=true
export NVM_AUTO_USE=true

# Node.js configurations
# @see: https://nodejs.org/api/cli.html#cli_environment_variables
export NODE_ENV=development
export NODE_PRESERVE_SYMLINKS=1
export NODE_OPTIONS='--max-old-space-size=4096'
