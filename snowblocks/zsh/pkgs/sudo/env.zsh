# Copyright (c) 2016-present Arctic Ice Studio <development@arcticicestudio.com>
# Copyright (c) 2016-present Sven Greb <development@svengreb.de>
# Copyright (c) 2021 Rafael Julio <development@rafifos.dev>

# Project:    dotfiles
# Repository: https://github.com/rafifos/dotfiles
# License:    MIT

# Set the style of the sudo prompt.
# See:
#   1. sudo(8)
export SUDO_PROMPT=$(print -P "%B%F{0}%K{6}sudo%b%f%k %B%F{14}%n%b%f@%F{4}%m%f: ")
