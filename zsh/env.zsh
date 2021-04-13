# Set's the shell options.
source $ZDOTDIR/lib/zsh/options.zsh

# XDG base directories specification.
# @see: https://wiki.archlinux.org/index.php/XDG_Base_Directory
# @see: https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html#variables
# @see: https://www.freedesktop.org/software/systemd/man/pam_systemd.html#Environment
export XDG_CACHE_HOME=${XDG_CACHE_HOME:-${HOME}/.cache}
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-${HOME}/.config}
export XDG_DATA_HOME=${XDG_DATA_HOME:-${HOME}/.local/share}

# The path to the history file.
# @see: http://zsh.sourceforge.net/Doc/Release/Parameters.html#index-HISTFILE
export HISTFILE=$XDG_CACHE_HOME/zsh/history

# The maximum number of stored events.
# @see: http://zsh.sourceforge.net/Doc/Release/Parameters.html#index-HISTSIZE
export HISTSIZE=10240
export SAVEHIST=$HISTSIZE

# Set's "Portuguese (Brazil)" as the fallback language.
export LC_ALL=${LC_ALL:-pt_BR.UTF-8}

# Remove the slash, period, angle brackets and dash characters from the default list.
# This allows to move backward and forward between words include these characters or when
# trying to only delete until the next character, e.g. for paths or dash-separated words.
export WORDCHARS='*?_[]~=&;!#$%^(){}'

# Tie (`-T`) the `FPATH` environment variable for unique (`-U`) entries.
# Extend the ZSH function search path where user-level functions should always take precedence.
export -TU FPATH fpath
fpath=($HOME/.local/functions $fpath)

# Tie (`-T`) the `PATH` environment variable for unique (`-U`) entries.
# Extend the executable search path where user-level applications should always take precedence.
export -TU PATH path
path=($HOME/.local/bin $path)

# Sets nvim as the default editor if it's installed.
if (( $+commands[nvim] )); then
  export EDITOR=nvim
  export VISUAL=$EDITOR
  export MANPAGER='nvim -R +MANPAGER -'
fi

# Load the VTE shell profile configuration to enable inheritance of the current working directory
# when opening a new terminal tab or splitting the current one.
# The script is necessary since some Linux distributions like Arch Linux only execute scripts in
# `/etc/profile.d` for login shells while not for non-login based shells which results in the state
# that the current directory is nve reported by VTE. This means when splitting terminals in Tilix
# instead of inheriting the directory from the current terminal the split terminal always opens in
# the home path of the current user.
# @see: https://gnunn1.github.io/tilix-web/manual/vteconfig
[[ -n $TILIX_ID || -n $VTE_VERSION && -f /etc/profile.d/vte.sh ]] && source /etc/profile.d/vte.sh

# Ensure the user-level ZSH cache directory exists.
[[ ! -d $XDG_CACHE_HOME/zsh ]] && mkdir -p $XDG_CACHE_HOME/zsh

# Initialize antigen.
export ANTIGEN_COMPDUMPFILE=$XDG_CACHE_HOME/antigen/zcompdump
source $ZDOTDIR/lib/antigen/bin/antigen.zsh

# Loads all files that ends with `.zsh` under the lib folder, excluding the `lib/antigen` folder and the
# lib/zsh/options.zsh file.
# @note: This requires the EXTENDED_GLOB option to be set.
source $ZDOTDIR/lib/^antigen**/^options*.zsh(N)

# Docker CE configuration.
(( $+commands[docker] )) && source $ZDOTDIR/opt/docker/environment.zsh

# Zsh plugin for installing, updating and loading nvm.
antigen bundle lukechilds/zsh-nvm

# Apply antigen bundles when not running interactively.
if [[ ! -o interactive ]]; then
  antigen apply
fi
