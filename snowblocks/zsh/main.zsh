# Copyright (c) 2016-present Arctic Ice Studio <development@arcticicestudio.com>
# Copyright (c) 2016-present Sven Greb <development@svengreb.de>
# Copyright (c) 2021 Rafael Julio <development@rafifos.dev>

# Project:    dotfiles
# Repository: https://github.com/rafifos/dotfiles
# License:    MIT License

export ZDOTDIR="${ZDOTDIR:-${XDG_CONFIG_HOME:-$HOME/.config}}/zsh"
[[ -x $ZDOTDIR && -f $ZDOTDIR/.zshenv ]] && source $ZDOTDIR/.zshenv
