# ~/.zshrc: Sourced by ZSH(1) in interactive shells. It should contain commands
# to set up aliases, functions, options, key bindings, etc.
#
# TODO: Continue to implement usefullness starting with:
# https://github.com/unixorn/awesome-zsh-plugins#completions

# Colored GCC warnings and errors.
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# make less more friendly for non-text input files, see lesspipe(1).
[[ -x /usr/bin/lesspipe ]] && eval "$(SHELL=/bin/sh lesspipe)"

# Enable color support for dircolors.
[[ -f ~/.dircolors ]] && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"

# Enables auto-completion/key bindings to fzf.
[[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh

# Workaround for distributions that ship mawk by default.
(( $+commands[gawk] )) && alias awk=gawk

# Enable colorized long listing with human-readable size.
alias ls='LC_COLLATE=C ls -lAh --color=auto --group-directories-first'

# List in raw format with one entry per line.
alias lsraw='LC_COLLATE=C \ls -N1 --group-directories-first'

# Enable unified diff format by default.
alias diff='diff -u'

# Disable wget log file
alias wget='wget --hsts-file='

# Shorthand for alias to
#
# * Prompt before overwriting files. (-i, --interactive)
# * Preserve: mode, ownership and timestamps. (-p)
# * Explain what operations are being done. (-v, --verbose)
alias cp='cp -ipv'

# Shorthand for alias to
#
# * Prompt before overwriting files. (-i, --interactive
# * Move only when the SOURCE file is newer than the destination file or when
#   the destination file is missing. (-u, --update)
# * Explain what operations are being done. (-v, --verbose)
alias mv='mv -iuv'

# Shorthand for alias to
#
# * Prompt once before removing more than three files, or when removing
#   recursively. (-i)
# * Explain what operations are being done. (-v, --verbose)
alias rm='rm -Iv'

# Shorthand for alias to
#
# * Only display ANSI "color" escape sequences in "raw" form.
#   (-R, --RAW-CONTROL-CHARS)
# * Automatically exit if the entire file can be displayed on the first screen.
#   (-F, --quit-if-one-screen)
# * Disable sending the termcap (de)initialization strings to the terminal to
#   avoid unnecessary operations like clearing the screen. (-X, --no-init)
# * Use two tab stops. (-x2, --tabs=n)
alias less='less -RFXx2'

# Show mode bits of files and directories in octal form.
#
# %A - Access rights in human readable form
# %a - Access rights in octal
# %N - Quoted file name with dereference if symbolic link
alias lsm='stat -c "%A %a %N"'

# Shows the current session time.
# Use option "-s" to show the session start.
#
# @param $@ (optional) the options
# @options ["-s","-h"]
# @throws 1 Unknown option
seti() {
  local uptime session
  session=0

  case "$1" in
    -s)
      session=1
      ;;
    -h)
      printf "\e[1mUsage: \e[36mseti \e[30m[OPTIONS]\n"
      printf "  \e[01;36m-s  \e[0mShow session start\n"
      printf "  \e[01;36m-h  \e[0mShow this help\e[0m\n"
      return 0
      ;;
    -*)
      printf "\e[31mUnknown option\e[0m"
      return 1
      ;;
  esac

  if [ $session -gt 0 ]
  then
    uptime=$(uptime -s)
  else
    uptime=$(</proc/uptime)
    uptime=${uptime%%.*}

    s=$(( uptime%60 ))
    m=$(( uptime/60%60 ))
    h=$(( uptime/60/60%24 ))
    d=$(( uptime/60/60/24 ))

    uptime=""$d"d "$h"h "$m"m "$s"s"
  fi
  printf "\e[36m%s\e[0m" "$uptime"
  return 0
}

# Create a new directory and enter it.
#
# @param $1 the name of the directory to create and enter
mkd() {
  mkdir -p "$@" && cd "$@"
}

# We use [zplug](https://github.com/zplug/zplug) for plugin management.
[[ ! -d ~/.zplug ]] && curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

source ~/.zplug/init.zsh

# Only loaded if an external program is installed.
zplug "b4b4r07/enhancd", use:init.sh, if:"(( $+commands[fzf] ))", hook-load: "export ENHANCD_FILTER=fzf"
zplug "modules/dpkg", from:prezto, if:"(( $+commands[dpkg] ))"
zplug "plugins/adb", from:oh-my-zsh, if:"(( $+commands[adb] ))"
zplug "plugins/cp", from:oh-my-zsh, if:"(( $+commands[rsync] ))"
zplug "plugins/httpie", from:oh-my-zsh, if:"(( $+commands[http] ))"
zplug "plugins/npm", from:oh-my-zsh, if:"(( $+commands[npm] ))"
zplug "plugins/repo", from:oh-my-zsh, if:"(( $+commands[repo] ))"
zplug "plugins/thefuck", from:oh-my-zsh, if:"(( $+commands[fuck] ))"
zplug "wfxr/forgit", if:"(( $+commands[fzf] ))"
zplug "zpm-zsh/clipboard", if:"(( $+commands[xclip] ))"

# Only loaded if a file is present.
zplug "zdharma/zsh-diff-so-fancy", use:"bin/diff-so-fancy", as:command, if:"[[  -f ~/.gitconfig.sec  ]]"

# Default plugins.
zplug "denysdovhan/gitio-zsh"
zplug "gmatheu/shell-plugins", use:"explain-shell/zsh-explain-shell.zsh"
zplug "MichaelAquilina/zsh-you-should-use"
zplug "modules/archive", from:prezto
zplug "modules/command-not-found", from:prezto
zplug "plugins/colored-man-pages", from:oh-my-zsh
zplug "plugins/transfer", from:oh-my-zsh
zplug "rapgenic/zsh-git-complete-urls"
zplug "yous/vanilli.sh"
zplug "zdharma/fast-syntax-highlighting", defer:2
zplug "zpm-zsh/colors"
zplug "zpm-zsh/ls"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-history-substring-search", defer:3

# Change it according to your up/down arrow keys.
# To see if they match with your keyboard, run cat -v and observe it's output.
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main pattern)
ZSH_HIGHLIGHT_PATTERNS+=("rm *" "fg=white,bold,bg=red")

ZSH_AUTOSUGGEST_USE_ASYNC=true

# Binds the "Ctrl + Space" to fetch a command autosuggestion.
bindkey '^ ' autosuggest-fetch

# Binds the "Ctrl + ->" to accept the command autosuggestion.
bindkey '^[[C' autosuggest-accept

# Using the "spaceship" prompt, made by Denys Dovhan.
# NOTE: You may want to install `jq` to avoid prompt slowness.
# See: https://github.com/denysdovhan/spaceship-prompt/blob/master/docs/Troubleshooting.md#why-is-my-prompt-slow
zplug "denysdovhan/spaceship-prompt", use:spaceship.zsh, as:theme

export SPACESHIP_PROMPT_ADD_NEWLINE=false
export SPACESHIP_PROMPT_FIRST_PREFIX_SHOW=true

export SPACESHIP_CHAR_SUFFIX=" "

export SPACESHIP_USER_SHOW=always

export SPACESHIP_HOST_SHOW=always
export SPACESHIP_HOST_SHOW_FULL=true

export SPACESHIP_DIR_TRUNC_PREFIX="…/"

export SPACESHIP_EXEC_TIME_ELAPSED=5

# Enable it if using a Laptop, or don't, it's on you.
export SPACESHIP_BATTERY_SHOW=false

export SPACESHIP_EXIT_CODE_SHOW=true
export SPACESHIP_EXIT_CODE_SUFFIX=" "

if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  else
    echo
  fi
fi

zplug load