# Copyright (c) 2016-present Arctic Ice Studio <development@arcticicestudio.com>
# Copyright (c) 2016-present Sven Greb <development@svengreb.de>
# Copyright (c) 2021 Rafael Julio <hello@rafifos.dev>

# Project:    dotfiles
# Repository: https://github.com/rafifos/dotfiles
# License:    MIT

# Extend the search paths with formula specific paths.
# The paths are "hardcoded" (e.g. `/usr/local/opt`) because `$(brew --prefix <package>) increases the
# start up time to more than 10 seconds!
fpath=($HOMEBREW_PREFIX/share/zsh/site-functions $fpath)
infopath=($HOMEBREW_PREFIX/share/info $infopath)
manpath=($HOMEBREW_PREFIX/share/man $manpath)
