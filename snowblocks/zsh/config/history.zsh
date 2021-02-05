# Copyright (c) 2016-present Arctic Ice Studio <development@arcticicestudio.com>
# Copyright (c) 2016-present Sven Greb <development@svengreb.de>
# Copyright (c) 2021 Rafael Julio <development@rafifos.dev>

# Project:    dotfiles
# Repository: https://github.com/rafifos/dotfiles
# License:    MIT License

# ZSH history configurations.
# See:
#   1. http://zsh.sourceforge.net/Doc/Release/Zsh-Modules.html#index-history-2

# The path to the history file.
# See:
#   1. http://zsh.sourceforge.net/Doc/Release/Parameters.html#index-HISTFILE
export HISTFILE=$ZSH_PATH_CACHE/history

# The maximum number of stored events.
# See:
#   1. http://zsh.sourceforge.net/Doc/Release/Parameters.html#index-HISTSIZE
export HISTSIZE=1000000000
export SAVEHIST=$HISTSIZE
