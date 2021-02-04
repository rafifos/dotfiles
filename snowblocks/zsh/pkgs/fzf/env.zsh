# Copyright (c) 2016-present Arctic Ice Studio <development@arcticicestudio.com>
# Copyright (c) 2016-present Sven Greb <development@svengreb.de>
# Copyright (c) 2021 Rafael Julio <hello@rafifos.dev>

# Project:    dotfiles
# Repository: https://github.com/rafifos/dotfiles
# License:    MIT License

# Configurations for fzf via environment variables.
# See:
#   1. https://github.com/junegunn/fzf
#   2. https://github.com/junegunn/fzf.vim
#   3. https://github.com/sharkdp/fd#using-fd-with-fzf
autoload -Uz use_nord_colors && use_nord_colors

FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS
# Use fzf in fullscreen mode with command line at the bottom, allow to cycle through results when moving out
# of range at the bottom or start and always use 2 spaces for tab stops.
FZF_DEFAULT_OPTS+="
  --no-height
  --no-reverse
  --cycle
  --tabstop=2"
# Set the path to the search history file and use the same maximum number of entires like for the ZSH
# command history.
FZF_DEFAULT_OPTS+="
  --history=$PATH_USER_CACHE/fzf/history
  --history-size=1000000000"
# Adjust the colors to match the "Nord" theme.
# See:
#   1. https://www.nordtheme.com
FZF_DEFAULT_OPTS+="
  --color bg:$ZSH_NORD_COLORS[0],bg+:$ZSH_NORD_COLORS[3],fg:$ZSH_NORD_COLORS[5]
  --color fg+:$ZSH_NORD_COLORS[6],hl:$ZSH_NORD_COLORS[8],hl+:$ZSH_NORD_COLORS[9]
  --color preview-bg:$ZSH_NORD_COLORS[0],preview-fg:$ZSH_NORD_COLORS[5]
  --color border:$ZSH_NORD_COLORS[3],gutter:$ZSH_NORD_COLORS[1],header:$ZSH_NORD_COLORS[8]
  --color info:$ZSH_NORD_COLORS[8],marker:$ZSH_NORD_COLORS[8],pointer:$ZSH_NORD_COLORS[9]
  --color prompt:$ZSH_NORD_COLORS[8],spinner:$ZSH_NORD_COLORS[8]"
export FZF_DEFAULT_OPTS

if type fd >/dev/null; then
  # Use fd as the default source for fzf.
  # Always follow symbolic links and include hidden files, but exclude VCS data like the .git folder.
  export FZF_DEFAULT_COMMAND='fd --type file --follow --hidden --exclude .git'
  # Apply the default command to the ^T key binding.
  export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND
fi
