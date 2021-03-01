# Configurations for enhancd, a next-generation cd command with an interactive filter ✨.
# @see: https://github.com/b4b4r07/enhancd#configuration

# The location that enhancd will store it's logs and source files.
export ENHANCD_DIR=$XDG_DATA_HOME/enhancd

# Ensures ENHANCD_DIR actually exists.
[[ ! -d $ENHANCD_DIR ]] && mkdir -p $ENHANCD_DIR

# Sets fzf as the default fuzzy finder.
(( $+commands[fzf] )) && export ENHANCD_FILTER=fzf
