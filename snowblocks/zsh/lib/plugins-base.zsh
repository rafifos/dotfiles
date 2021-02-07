# Copyright (c) 2016-present Arctic Ice Studio <development@arcticicestudio.com>
# Copyright (c) 2016-present Sven Greb <development@svengreb.de>
# Copyright (c) 2021 Rafael Julio <development@rafifos.dev>

# Project:    dotfiles
# Repository: https://github.com/rafifos/dotfiles
# License:    MIT License

# zplug base setup and plugins.
# See:
#   1. https://github.com/zplug/zplug

# Ensure zplug is installed, otherwise run the setup script.
if [[ ! -d $ZPLUG_HOME ]]; then
  if type curl >/dev/null; then
    # Run in silent mode to suppress progress bars (`-s`) and only follow redirects (`-L`)
    # for HTTPS (`--proto-redir -all,https`).
    curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
  fi
fi

# Initialize zplug if it is installed, otherwise skip loading of defined plugins.
[[ -f $ZPLUG_HOME/init.zsh ]] && source $ZPLUG_HOME/init.zsh || return 0

# Replaces ZSH's default completion selection menu with fzf.
# This plugin must be sourced after compinit, but before plugins that wrap widgets like e.g.
# "zsh-users/zsh-autosuggestions".
zplug "Aloxaf/fzf-tab", defer:2

# Provides archive and unarchive functions for easy archive manipulation.
zplug "zimfw/archive"

# Provides a convenient way to load ssh-agent. This enables one-time login and caching of ssh credentials per session.
zplug "zimfw/ssh"

# A next-generation `cd` command with an interactive filter.
zplug "b4b4r07/enhancd", use:init.sh

# Clears previous command output every time before new command executed in shell.
zplug "Valiev/almostontop"

# A zsh plugin that reminds you that you should use one of your existing aliases for a command you just typed.
zplug "MichaelAquilina/zsh-you-should-use"

# Clean-room implementation of the Fish shell's history search feature.
zplug "zsh-users/zsh-history-substring-search"

# Additional completion definitions for Zsh.
zplug "zsh-users/zsh-completions"

# Suggests commands while typing based on history and completions.
zplug "zsh-users/zsh-autosuggestions", defer:2, on:"zsh-users/zsh-autosuggestions"

# Syntax highlighting for commands whilst they are typed.
# This helps in reviewing commands before running them, particularly in catching syntax errors.
# The loading priority is deferred because it must be executed after compinit and sourcing of other plugins.
# The custom theme must be loaded via zplug in in order to override the default styles of the plugin.
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "$ZDOTDIR/pkgs/zplug/plugins/zsh-users/zsh-syntax-highlighting", \
  on:"zsh-users/zsh-syntax-highlighting", \
  from:local, \
  use:"theme-nord.zsh", \
  defer:2
