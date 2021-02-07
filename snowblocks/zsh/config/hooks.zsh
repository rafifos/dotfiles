# Copyright (c) 2016-present Arctic Ice Studio <development@arcticicestudio.com>
# Copyright (c) 2016-present Sven Greb <development@svengreb.de>
# Copyright (c) 2021 Rafael Julio <development@rafifos.dev>

# Project:    dotfiles
# Repository: https://github.com/rafifos/dotfiles
# License:    MIT License

# Implementations of the ZSH hook functions.
# See:
#   1. http://zsh.sourceforge.net/Doc/Release/Functions.html#Hook-Functions

# Sets up Node.js with nvm when cd-ing into directories.
add-zsh-hook chpwd load_nvmrc
