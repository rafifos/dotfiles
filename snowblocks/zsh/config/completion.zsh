# Copyright (c) 2016-present Arctic Ice Studio <development@arcticicestudio.com>
# Copyright (c) 2016-present Sven Greb <development@svengreb.de>
# Copyright (c) 2021 Rafael Julio <hello@rafifos.dev>

# Project:    dotfiles
# Repository: https://github.com/rafifos/dotfiles
# License:    MIT License

# Load the ZSH completion system using a custom path for the compiled cache file.
# See:
#   1. http://zsh.sourceforge.net/Doc/Release/Completion-System.html#Use-of-compinit
autoload -Uz compinit
compinit -d $ZSH_PATH_CACHE/.zcompdump-$HOSTNAME-${ZSH_PATCHLEVEL:-$ZSH_VERSION}
