# Copyright (c) 2021 Rafael Julio <development@rafifos.dev>

# Project:    dotfiles
# Repository: https://github.com/rafifos/dotfiles
# License:    MIT License

# "Nord" color theme for the highlighting suggestions of  zsh-users/zsh-syntax-autosuggestions plugin.
# See:
#   1. https://www.nordtheme.com
#   2. https://github.com/zsh-users/zsh-autosuggestions#configuration
autoload -Uz use_nord_colors && use_nord_colors

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=$ZSH_NORD_COLORS[11]"

# Configurations for the zsh-users/zsh-autosuggestions plugin.
# See:
#   1. https://github.com/zsh-users/zsh-autosuggestions#configuration
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
ZSH_AUTOSUGGEST_USE_ASYNC=true
