# Copyright (c) 2016-present Arctic Ice Studio <development@arcticicestudio.com>
# Copyright (c) 2016-present Sven Greb <development@svengreb.de>
# Copyright (c) 2021 Rafael Julio <development@rafifos.dev>

# Project:    dotfiles
# Repository: https://github.com/rafifos/dotfiles
# License:    MIT License

# Initialisation for new style completion. This mainly contains some helper
# functions and setup.
# See:
#   1. https://github.com/zsh-users/zsh/blob/master/Completion/compinit
autoload -Uz compinit

# Enable and initialize ZSH's prompt theme and configuration support.
# See:
#   1. http://zsh.sourceforge.net/Doc/Release/User-Contributions.html#Prompt-Themes
autoload -Uz promptinit && promptinit
