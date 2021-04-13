# Configure ZSH feature options.
# @see: http://zsh.sourceforge.net/Doc/Release/Options.html

# If a command is issued that can't be executed as a normal command, and the command is the name of a directory,
# perform the `cd` command to that directory.
setopt AUTO_CD

# Disable beep on an ambiguous completion.
setopt NO_LIST_BEEP

# Make globbing case insensitive.
setopt NO_CASE_GLOB

# Treat the `#`, `~` and `^` characters as part of patterns for filename generation.
# Note that an initial unquoted `~` always produces named directory expansion.
setopt EXTENDED_GLOB

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

# Run all background jobs with the same priority as foreground tasks.
setopt NO_BG_NICE

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
