# Copyright (c) 2016-present Arctic Ice Studio <development@arcticicestudio.com>
# Copyright (c) 2016-present Sven Greb <development@svengreb.de>
# Copyright (c) 2021 Rafael Julio <hello@rafifos.dev>

# Project:    dotfiles
# Repository: https://github.com/rafifos/dotfiles
# License:    MIT License

# Populate the database with color output configurations for file types and extensions.
# See.
#   1. https://www.gnu.org/software/coreutils/manual/html_node/dircolors-invocation.html
#   2. dircolors(1)
#   3. dir_colors(5)
if type dircolors >/dev/null && [[ -f $PATH_USER_CONFIG/dircolors/dir_colors ]]; then
  eval $(dircolors $PATH_USER_CONFIG/dircolors/dir_colors)
fi
