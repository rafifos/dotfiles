# Copyright (c) 2016-present Arctic Ice Studio <development@arcticicestudio.com>
# Copyright (c) 2016-present Sven Greb <development@svengreb.de>
# Copyright (c) 2021 Rafael Julio <development@rafifos.dev>

# Project:    dotfiles
# Repository: https://github.com/rafifos/dotfiles
# License:    MIT

use_nord_colors

# Set the style of the sudo prompt.
# See:
#   1. sudo(8)
export SUDO_PROMPT=$(print -P "%B%F{\${ZSH_NORD_COLORS[6]}}%K{\${ZSH_NORD_COLORS[11]}}sudo%b%f%k %B%F{\${ZSH_NORD_COLORS[15]}}%n%b%f@%F{\${ZSH_NORD_COLORS[13]}%m%f: ")
