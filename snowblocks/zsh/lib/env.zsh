# Copyright (c) 2016-present Arctic Ice Studio <development@arcticicestudio.com>
# Copyright (c) 2016-present Sven Greb <development@svengreb.de>
# Copyright (c) 2021 Rafael Julio <development@rafifos.dev>

# Project:    dotfiles
# Repository: https://github.com/rafifos/dotfiles
# License:    MIT License

# Custom variables for XDG base directories to support OS that don't adhere to the specifications like macOS.
export PATH_USER_CACHE="${PATH_USER_CACHE:-$HOME/.cache}"
export PATH_USER_CONFIG="${PATH_USER_CONFIG:-$HOME/.config}"
export PATH_USER_DATA="${PATH_USER_DATA:-$HOME/.local/share}"
export PATH_USER_BIN=$HOME/.local/bin
export PATH_USER_FUNC=$HOME/.local/functions
export PATH_USER_INFO="${PATH_USER_INFO:-$PATH_USER_DATA/info}"
export PATH_USER_MAN="${PATH_USER_MAN:-$PATH_USER_DATA/man}"

# Custom variables for XDG user directories to support OS that don't adhere to the specifications like macOS.
export PATH_USER_DESKTOP="${PATH_USER_DESKTOP:-${XDG_DESKTOP_DIR:-HOME/Desktop}}"
export PATH_USER_DOCUMENTS="${PATH_USER_DOCUMENTS:-${XDG_DOCUMENTS_DIR:-HOME/Documents}}"
export PATH_USER_DOWNLOADS="${PATH_USER_DOWNLOADS:-${XDG_DOWNLOAD_DIR:-HOME/Downloads}}"
export PATH_USER_MUSIC="${PATH_USER_MUSIC:-${XDG_MUSIC_DIR:-HOME/Music}}"
export PATH_USER_IMAGES="${PATH_USER_IMAGES:-${XDG_PICTURES_DIR:-HOME/Images}}"
export PATH_USER_TEMPLATES="${PATH_USER_TEMPLATES:-${XDG_TEMPLATES_DIR:-HOME/Templates}}"
export PATH_USER_VIDEOS="${PATH_USER_VIDEOS:-${XDG_VIDEOS_DIR:-HOME/Videos}}"

# The custom path for the ZSH cache directory.
export ZSH_PATH_CACHE=$PATH_USER_CACHE/zsh

# The name of the ZSH prompt theme.
export ZSH_PROMPT_THEME_NAME="${ZSH_PROMPT_THEME_NAME:-rh}"

# Allows to disable support for 24-bit colors ("true color").
# This variable is read for different configurations in order to disable the usage of HEX triplets
# when specifying colors for prompts and line editor highlighting.
export ZSH_NO_TRUE_COLOR="${ZSH_NO_TRUE_COLOR:-false}"

# Set basic configurations for Unix core applications and commands.
export LANG=${LANG:-pt_BR.UTF-8}
export LANGUAGE=${LANGUAGE:-pt_BR.UTF-8}
export LC_ALL=${LC_ALL:-pt_BR.UTF-8}
export LC_COLLATE=${LC_COLLATE:-pt_BR.UTF-8}
export LC_CTYPE=${LC_CTYPE:-pt_BR.UTF-8}
export LC_MESSAGES=${LC_MESSAGES:-pt_BR.UTF-8}
export LC_MONETARY=${LC_MONETARY:-pt_BR.UTF-8}
export LC_NUMERIC=${LC_NUMERIC:-pt_BR.UTF-8}
export LC_TIME=${LC_TIME:-pt_BR.UTF-8}

if type nvim >/dev/null; then
  export EDITOR="nvim"
  export MANPAGER="nvim -R +MANPAGER -"
  export VISUAL="nvim"
fi
