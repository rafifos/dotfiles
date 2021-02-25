# To help unclutter HOME we're telling zsh to load it's startups files from XDG_CONFIG_HOME.
export ZDOTDIR=${XDG_CONFIG_HOME:-${HOME}/.config}/zsh

# This file is only a shim to the actual .zshenv. It's here to make things a little bit tiddier.
[[ -f ${ZDOTDIR}/.zshenv ]] && source ${ZDOTDIR}/.zshenv
