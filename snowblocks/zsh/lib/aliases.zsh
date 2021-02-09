# Copyright (c) 2021 Rafael Julio <development@rafifos.dev>

# Project:    dotfiles
# Repository: https://github.com/rafifos/dotfiles
# License:    MIT License

# Downloads a remote file using aria2c with opinionated fallbacks.
# The order of preference is: aria2c, http, wget, curl.
# This order is derrived from speed based on personal tests.
# See:
#   1. https://github.com/zimfw/utility/blob/5fc2348ff5688972cdc87a2010796525e9656966/init.zsh#L32
if (( ${+commands[aria2c]} )); then
  alias get='aria2c --max-connection-per-server=8 --continue'
elif (( ${+commands[http]} )); then
  alias get='http --check-status --follow --download'
elif (( ${+commands[wget]} )); then
  alias get='wget --continue --progress=bar --timestamping'
elif (( ${+commands[curl]} )); then
  alias get='curl --continue-at - --location --progress-bar --remote-name --remote-time'
fi

# If pbzip2/pigz are available, alias them as they are drop-in replacements for bzip2/gzip, respectively.
# See:
#   1. https://github.com/zimfw/archive/blob/master/init.zsh
if (( ${+commands[pbzip2]} )) alias bzip2='pbzip2'
if (( ${+commands[pbunzip2]} )) alias bunzip2='pbunzip2'
if (( ${+commands[pigz]} )) alias gzip='pigz'
if (( ${+commands[unpigz]} )) alias gunzip='unpigz'
