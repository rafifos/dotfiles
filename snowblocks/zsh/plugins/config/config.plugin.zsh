# Standartized way to get the plugin location. It's usage is `${0:h}`.
# See: https://github.com/zdharma/Zsh-100-Commits-Club/blob/master/Zsh-Plugin-Standard.adoc#1-standardized-0-handling
0="${ZERO:-${${0:#$ZSH_ARGZERO}:-${(%):-%N}}}"
0="${${(M)0:#/*}:-$PWD/$0}"

# Adds the functions directory to $fpath if this isn't handled automatically by the plugin manager.
if [[ $PMSPEC != *f* ]] {
  fpath+=( "${0:h}/functions" )
}

# Adds binaries to $path.
if [[ $PMSPEC != *b* ]] {
  path+=( "${PWD}/bin" )
}

# Configure ZSH feature options.
# See: http://zsh.sourceforge.net/Doc/Release/Options.html

# If a command is issued that can't be executed as a normal command, and the command is the name of a directory,
# perform the `cd` command to that directory.
setopt AUTO_CD

# Make cd push the old directory to the directory stack.
setopt AUTO_PUSHD

# If the argument to a cd command (or an implied cd with the AUTO_CD option set) is not a directory, and does not begin
# with a slash, try to expand the expression as if it were preceded by a "~".
setopt CDABLE_VARS

# Don't push multiple copies of the same directory to the stack.
setopt PUSHD_IGNORE_DUPS

# Don't print the directory stack after pushd or popd.
setopt PUSHD_SILENT

# Have pushd without arguments act like `pushd ${HOME}`.
setopt PUSHD_TO_HOME

# Disable beep on an ambiguous completion.
setopt NO_LIST_BEEP

# Make globbing case insensitive.
setopt NO_CASE_GLOB

# Treat the `#`, `~` and `^` characters as part of patterns for filename generation.
# Note that an initial unquoted `~` always produces named directory expansion.
setopt EXTENDED_GLOB

# Disable printing of errors if a pattern for filename generation has no matches.
setopt NO_NOMATCH

# Entirely disable error logging if a pattern for filename generation has no matches.
# Pattern that don't match are removed from the argument list instead.
# If no file matches a blank line is printed, with no error.
# Overrides the `NOMATCH` option.
setopt NULL_GLOB

# Save each command's beginning Unix timestamp and the duration in seconds.
setopt EXTENDED_HISTORY

# Disable beep in ZLE when a widget attempts to access a non-existing history entry.
setopt NO_HIST_BEEP

# Remove the oldest history event that has a duplicate first before unique events when reaching the size limit.
setopt HIST_EXPIRE_DUPS_FIRST

# Hide duplicates of previous events when searching for history entries in the line editor.
setopt HIST_FIND_NO_DUPS

# Don't store events if they are duplicates of the previous event.
setopt HIST_IGNORE_DUPS

# Don't store events when the first character on the line is a space or when one of the expanded aliases contains
# a leading space.
# Note that the command is still kept in the internal history until the next command before it vanishes,
# allowing to briefly reuse or edit the line.
setopt HIST_IGNORE_SPACE

# Don't store function definitions.
# Note that the command is still kept in the internal history until the next command before it vanishes,
# allowing to briefly reuse or edit the line.
setopt HIST_NO_FUNCTIONS

# Remove superfluous blanks from events being added to the history list.
# This can also prevent duplicate entries when a previous event would not match in its untidied form.
# Note that the shell is smart enough not to remove blanks which are important, i.e. when quoted.
setopt HIST_REDUCE_BLANKS

# Don't store duplicate event at all, older commands that duplicate newer ones are omitted.
setopt HIST_SAVE_NO_DUPS

# Don't execute the command directly upon history expansion.
setopt HIST_VERIFY

# New history lines are added to `HISTFILE` incrementally as soon as they are entered,
# rather than waiting until the shell exits.
setopt INC_APPEND_HISTORY

# Cause all terminals to share the same history 'session'.
setopt SHARE_HISTORY

# Disallow `>` to overwrite existing files. Use `>|` or `>!` instead.
setopt NO_CLOBBER

# Allow comments even in interactive shells.
setopt INTERACTIVE_COMMENTS

# Perform path search even on command names with slashes in them.
setopt PATH_DIRS

# Run all background jobs with the same priority as foreground tasks.
setopt NO_BG_NICE

# Prevent status report of jobs on shell exit.
setopt NO_CHECK_JOBS

# Prevent SIGHUP to jobs on shell exit.
setopt NO_HUP

# List jobs in verbose format by default.
setopt LONG_LIST_JOBS

# Disable immediately status reporting of background jobs to prevent messing up and reprinting the current line.
setopt NO_NOTIFY

# Enable parameter expansion, command substitution and arithmetic expansion in prompts.
# Note that substitutions within prompts do not affect the command status.
setopt PROMPT_SUBST

# Output hexadecimal numbers in the standard C format, for example '0xFF' instead of the usual '16#FF'. If the option
# OCTAL_ZEROES is also set (it is not by default), octal numbers will be treated similarly and hence appear as '077'
# instead of '8#77'. This option has no effect on the choice of the output base, nor on the output of bases other than
# hexadecimal and octal. Note that these formats will be understood on input irrespective of the setting of C_BASES.
setopt C_BASES

# By default, when a pipeline exits the exit status recorded by the shell and returned by the shell variable $? reflects
# that of the rightmost element of a pipeline. If this option is set, the exit status instead reflects the status of the
# rightmost element of the pipeline that was non-zero, or zero if all elements exited with zero status.
setopt PIPE_FAIL

# Split on unquoted parameter expansions.
setopt SH_WORD_SPLIT

# Disable beep on error in ZLE.
setopt NO_BEEP

# Complete from both ends of a word.
setopt COMPLETE_IN_WORD

# Move cursor to the end of a completed word.
setopt ALWAYS_TO_END

# Perform path search even on command names with slashes.
setopt PATH_DIRS

# Show completion menu on a successive tab press.
setopt AUTO_MENU

# Automatically list choices on ambiguous completion.
setopt AUTO_LIST

# If completed parameter is a directory, add a trailing slash.
setopt AUTO_PARAM_SLASH

# Do not autoselect the first completion entry.
unsetopt MENU_COMPLETE

# Disable start/stop characters in shell editor.
unsetopt FLOW_CONTROL

# XDG base directories specification.
# See:
#   1. https://wiki.archlinux.org/index.php/XDG_Base_Directory
#   2. https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html#variables
#   3. https://www.freedesktop.org/software/systemd/man/pam_systemd.html#Environment
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-${HOME}/.cache}"
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-${HOME}/.config}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}"

# Ensure the user-level ZSH cache directory exists.
[[ ! -d "$XDG_CACHE_HOME/zsh" ]] && mkdir -p "$XDG_CACHE_HOME/zsh"

# The path to the history file.
# See: http://zsh.sourceforge.net/Doc/Release/Parameters.html#index-HISTFILE
export HISTFILE="$XDG_CACHE_HOME/zsh/history"

# The maximum number of stored events.
# See: http://zsh.sourceforge.net/Doc/Release/Parameters.html#index-HISTSIZE
export HISTSIZE=10240
export SAVEHIST="$HISTSIZE"

# Remove the slash, period, angle brackets and dash characters from the default list.
# This allows to move backward and forward between words include these characters or when
# trying to only delete until the next character, e.g. for paths or dash-separated words.
export WORDCHARS='*?_[]~=&;!#$%^(){}'

# Tie (`-T`) the `FPATH` environment variable for unique (`-U`) entries.
# Extend the ZSH function search path where user-level functions should always take precedence.
export -TU FPATH fpath
fpath=("${HOME}/.local/functions" $fpath)

# Tie (`-T`) the `PATH` environment variable for unique (`-U`) entries.
# Extend the executable search path where user-level applications should always take precedence.
export -TU PATH path
path=("${HOME}/.local/bin" $path)

# Set's the output of various programs to use the ISO 8601 format.
# See: https://www.gnu.org/software/coreutils/manual/html_node/Formatting-file-timestamps.html
export TIME_STYLE='iso'

# Set the terminfo capability substrings for the color environment variable interpreted by the
# "termcap" compatibility application interface.
#
# fn - File names prefixing any content line.
# ln - Line numbers prefixing any content line.
# mt - Matching non-empty text in any matching line.
# se - Separators that are inserted between selected line fields (`:`), context line fields (`-`) and
#      groups of adjacent lines when nonzero context is specified (`--`)
# See:
#   1. http://www.gnu.org/software/grep/manual/grep.html
#   2. terminfo(5)
export GREP_COLORS="fn=34:ln=01;30:mt=01;34:se=30"

# Pass options by default to...
# - only display ANSI "color" escape sequences in "raw" form (`-R`, `--RAW-CONTROL-CHARS`)
# - automatically exit if the entire file can be displayed on the first screen (`-F`, `--quit-if-one-screen`)
# - disable sending the termcap (de)initialization strings to the terminal to avoid unnecessary operations like
#   clearing the screen (`-X`, `--no-init`)
# - use two tab stops (`-x2`, `--tabs=n`)
export LESS='-RFXx2'

# Set's the charset to UTF-8.
export LESSCHARSET='utf-8'

# Set the terminfo variables of the "termcap" compatibility application interface.
# Provides colored output for the `man` command.
#
# Escape Sequences Comparison Table
# ==================================
# termcap  terminfo  function
# -------  --------  --------
# ks       smkx      Send commands via keypad
# ke       rmkx      Send digits via keypad
# vb       flash     Emit visual bell
# mb       blink     Start blink
# md       bold      Start bold
# me       sgr0      Turn off bold, blink and underline
# so       smso      Start standout (reverse video)
# se       rmso      Stop standout
# us       smul      Start underline
# ue       rmul      Stop underline
#
# See:
#   1. https://www.gnu.org/software/less
#   2. terminfo(5)
export LESS_TERMCAP_mb=$'\e[01;34m'
export LESS_TERMCAP_md=$'\e[01;34m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;30m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_us=$'\e[01;34m'
export LESS_TERMCAP_ue=$'\e[0m'

# Set the style of the sudo prompt.
# See: sudo(8)
export SUDO_PROMPT=$(print -P "%B%F{0}%K{6}sudo%b%f%k %B%F{14}%n%b%f@%F{4}%m%f: ")

# Path to the configuration file.
# See: https://www.gnu.org/software/wget/manual/html_node/Startup-File.html
export WGETRC="${XDG_CONFIG_HOME:-${HOME}/.config}/wget/wgetrc"

# Create and populate a zkbd compatible hash with terminfo(5) mappings.
# xterm-compatible terminals can use extended key-definitions from user_caps(5).
typeset -g -A key

key['Left']="${terminfo[kcub1]}"
key['Right']="${terminfo[kcuf1]}"
key['Up']="${terminfo[kcuu1]}"
key['Down']="${terminfo[kcud1]}"
key['Shift-Tab']="${terminfo[kcbt]}"
key['Home']="${terminfo[khome]}"
key['End']="${terminfo[kend]}"
key['Backspace']="${terminfo[kbs]}"
key['Control']='\C-'
key['Control-Left']='^[[1;5D'
key['Control-Right']='^[[1;5C'
key['Del']="${terminfo[kdch1]}"
key['Page-Up']="${terminfo[kpp]}"
key['Page-Down']="${terminfo[knp]}"
key['Insert']="${terminfo[kich1]}"

# Common keybindings.
[[ -n ${key['Left']} ]] && bindkey -- "${key['Left']}" backward-char
[[ -n ${key['Right']} ]] && bindkey -- "${key['Right']}" forward-char
[[ -n ${key['Up']} ]] && bindkey -- "${key['Up']}" up-line-or-history
[[ -n ${key['Down']} ]] && bindkey -- "${key['Down']}" down-line-or-history
[[ -n ${key['Page-Up']} ]] && bindkey -- "${key['Page-Up']}" up-line-or-history
[[ -n ${key['Page-Down']} ]] && bindkey -- "${key['Page-Down']}" down-line-or-history
[[ -n ${key['Backspace']} ]] && bindkey -- "${key['Backspace']}" backward-delete-char
[[ -n ${key['Del']} ]] && bindkey -- "${key['Del']}" delete-char
[[ -n ${key['Home']} ]] && bindkey -- "${key['Home']}" beginning-of-line
[[ -n ${key['End']} ]] && bindkey -- "${key['End']}" end-of-line
[[ -n ${key['Insert']} ]] && bindkey -- "${key['Insert']}" overwrite-mode
[[ -n ${key['Shift-Tab']} ]] && bindkey -- "${key['Shift-Tab']}" reverse-menu-complete

# Allow to use ^← to move to the beginning of the previous word and ^→ to move to
# the beginning of the next word.
[[ -n ${key['Control-Left']} ]] && bindkey -- "${key['Control-Left']}" backward-word
[[ -n ${key['Control-Right']} ]] && bindkey -- "${key['Control-Right']}" forward-word

# Expands .. at the beginning, after space, or after any of ! " & ' / ; < > |
autoload -Uz zle_double_dot_expand
bindkey '.' zle_double_dot_expand
bindkey -M isearch '.' self-insert
zle -N zle_double_dot_expand

# Load the VTE shell profile configuration to enable inheritance of the current working directory
# when opening a new terminal tab or splitting the current one.
# The script is necessary since some Linux distributions like Arch Linux only execute scripts in
# `/etc/profile.d` for login shells while not for non-login based shells which results in the state
# that the current directory is nve reported by VTE. This means when splitting terminals in Tilix
# instead of inheriting the directory from the current terminal the split terminal always opens in
# the home path of the current user.
# See: https://gnunn1.github.io/tilix-web/manual/vteconfig
[[ -n $TILIX_ID || -n $VTE_VERSION && -f /etc/profile.d/vte.sh ]] && source /etc/profile.d/vte.sh

# Handy alias to automagically switch to a temporary folder.
alias mktempd='cd "$(mktemp -d)"'

# Add "safety net" for basic but irreversible file system operations by using
# verbose and interactive command modes.
alias cp='command cp -vi'
alias mv='command mv -vi'
alias rm='command rm -vi'

# Enable colorized long listing with human-readable size- and ISO-8601 date formats.
# The time style is inherited from the TIME_STYLE environment variable.
alias ls='command ls -AGgh --color=auto --group-directories-first --time-style="+"'
alias ll='ls -l'
alias l='ls'

# Print permission bits in octal (%a) and file type in human readable form (%A)
# and quote file name with dereference for symbolic links (%N).
alias lsp='command stat -c "%A %a %N"'

# Output NUM (3) lines of unified context.
alias diff='diff -U'

# Colorizes output and enables line numbers.
alias grep='grep --color=auto --line-number'

# Enable alias expansion for commands run by `sudo`.
alias sudo='sudo '
