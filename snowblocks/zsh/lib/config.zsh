# Copyright (c) 2016-present Arctic Ice Studio <development@arcticicestudio.com>
# Copyright (c) 2016-present Sven Greb <development@svengreb.de>
# Copyright (c) 2021 Rafael Julio <hello@rafifos.dev>

# Project:    dotfiles
# Repository: https://github.com/rafifos/dotfiles
# License:    MIT License

# Ensure the user-level ZSH cache directory exists.
[[ ! -d $PATH_USER_CACHE/zsh ]] && mkdir -p $PATH_USER_CACHE/zsh
