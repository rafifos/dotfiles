# Configurations for fzf via environment variables.
# See:
#   1. https://github.com/junegunn/fzf
#   2. https://github.com/junegunn/fzf.vim
#   3. https://github.com/sharkdp/fd#using-fd-with-fzf

# Adds functions to $fpath.
if [[ $PMSPEC != *f* ]] {
  fpath+=( "${PWD}/functions" )
}

# The file to which fzf's history will be saved.
local FZF_CACHE_DIR="${XDG_CACHE_HOME:-${HOME}/.cache}/fzf"
local FZF_HISTFILE="${FZF_CACHE_DIR}/history"

# Ensures FZF_HISTFILE exists.
[[ ! -d "${FZF_CACHE_DIR}" ]] && mkdir -p "${FZF_CACHE_DIR}"

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
  --history=${FZF_HISTFILE}
  --history-size=10240"

# Adjust the colors to match the "Nord" theme.
# See:
#   1. https://www.nordtheme.com
FZF_DEFAULT_OPTS+="
  --color bg:#2E3440,bg+:#4C566A,fg:#E5E9F0
  --color fg+:#ECEFF4,hl:#88C0D0,hl+:#81A1C1
  --color preview-bg:#2E3440,preview-fg:#E5E9F0
  --color border:#4C566A,gutter:#3B4252,header:#88C0D0
  --color info:#88C0D0,marker:#88C0D0,pointer:#81A1C1
  --color prompt:#88C0D0,spinner:#88C0D0"

export FZF_DEFAULT_OPTS

# Options to fzf command
export FZF_COMPLETION_OPTS='+c -x'

# Default command to run.
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'

# Apply the default command to the ^T key binding.
export FZF_CTRL_T_COMMAND="${FZF_DEFAULT_COMMAND}"

# Unset local variables for cleanup.
unset FZF_CACHE_DIR
unset FZF_HISTFILE
