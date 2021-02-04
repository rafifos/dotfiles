# Copyright (c) 2016-present Arctic Ice Studio <development@arcticicestudio.com>
# Copyright (c) 2016-present Sven Greb <development@svengreb.de>

# Project:    dotfiles
# Repository: https://github.com/rafifos/dotfiles
# License:    MIT

# ZSH plugins managed by zplug.
# See:
#   1. https://github.com/zplug/zplug
[[ -f $ZDOTDIR/lib/plugins-base.zsh ]] && source $ZDOTDIR/lib/plugins-base.zsh

zplug "$HOMEBREW_PREFIX/opt/fzf", \
  from:local, \
  if:"type fzf > /dev/null && [[ -d $HOMEBREW_PREFIX/opt/fzf ]]", \
  use:"shell/{completion,key-bindings}.zsh"

# Load all plugins and add commands to the executable search path.
zplug load
