# Copyright (c) 2016-present Arctic Ice Studio <development@arcticicestudio.com>
# Copyright (c) 2016-present Sven Greb <development@svengreb.de>
# Copyright (c) 2021 Rafael Julio <development@rafifos.dev>

# Project:    dotfiles
# Repository: https://github.com/rafifos/dotfiles
# License:    MIT License

# Add to HOOK the given FUNCTION.
# HOOK is one of chpwd, precmd, preexec, periodic, zshaddhistory,
# zshexit, zsh_directory_name (the _functions subscript is not required).
#
# With -d, remove the function from the hook instead; delete the hook
# variable if it is empty.
#
# -D behaves like -d, but pattern characters are active in the
# function name, so any matching function will be deleted from the hook.
#
# Without -d, the FUNCTION is marked for autoload; -U is passed down to
# autoload if that is given, as are -z and -k.  (This is harmless if the
# function is actually defined inline.)
# See:
#   1. https://github.com/zsh-users/zsh/blob/master/Functions/Misc/add-zsh-hook
autoload -U add-zsh-hook

# Add to HOOK the given WIDGET
#
# HOOK is one of isearch-exit, isearch-update, line-pre-redraw, line-init,
# line-finish, history-line-set, keymap-select (the zle- prefix is allowed
# but not required).  If a widget corresponding to HOOK already exists, it
# is preserved and called first in the new set of HOOK widgets.
#
# With -d, remove the WIDGET from the hook instead; deletes the hook
# linkage if it is empty.
#
# -D behaves like -d, but pattern characters are active in WIDGET, so
# any matching widget will be deleted from the hook.
#
# Without -d, if the WIDGET is not already defined, a function having the
# same name is marked for autoload; -U is passed down to autoload if that
# is given, as are -z and -k.  (This is harmless if the function is
# already defined.)  The WIDGET is then created with zle -N.
#
# The -L option lists the hooks and their associated widgets.
# See:
#   1. https://github.com/zsh-users/zsh/blob/master/Functions/Misc/add-zle-hook-widget
autoload -Uz add-zle-hook-widget

# Initialisation for new style completion. This mainly contains some helper
# functions and setup.
# See:
#   1. https://github.com/zsh-users/zsh/blob/master/Completion/compinit
autoload -Uz compinit

# Enable and initialize ZSH's prompt theme and configuration support.
# See:
#   1. http://zsh.sourceforge.net/Doc/Release/User-Contributions.html#Prompt-Themes
autoload -Uz promptinit && promptinit

# bracketed-paste-url-magic quotes pasted urls automatically, if the
# paste exactly starts with a url, eg no spaces or other characters precede it
#
# If the numeric argument is provided (eg, pressing alt-0 or alt-1 in emacs mode,
# or just the number by itself in vi command mode), then
# 0 is the default and means auto detect urls
# 1 means always quote
# any other value means never quote
# See:
#   1. https://github.com/zsh-users/zsh/blob/master/Functions/Zle/bracketed-paste-url-magic
autoload -Uz bracketed-paste-url-magic

# Functions to make it easier to type URLs as command line arguments. As
# you type, the input character is analyzed and, if it may need quoting,
# the current word is checked for a URI scheme.  If one is found and the
# current word is not already in quotes, a backslash is inserted before
# the input character.
# See:
#   1. https://github.com/zsh-users/zsh/blob/master/Functions/Zle/url-quote-magic
autoload -Uz url-quote-magic

# Like up-line-or-search, but uses the whole line prefix up to the
# cursor position for searching backwards.
# See:
#   1. https://github.com/zsh-users/zsh/blob/master/Functions/Zle/up-line-or-beginning-search
autoload -Uz up-line-or-beginning-search

# Like down-line-or-search, but uses the whole line prefix up to the
# cursor position for searching forwards.
# See:
#   1. https://github.com/zsh-users/zsh/blob/master/Functions/Zle/down-line-or-beginning-search
autoload -Uz down-line-or-beginning-search

# Edit the command line using your usual editor.
# Binding this to '!' in the vi command mode map,
#   autoload -Uz edit-command-line
#   zle -N edit-command-line
#   bindkey -M vicmd '!' edit-command-line
# will give ksh-like behaviour for that key,
# except that it will handle multi-line buffers properly.
# See:
#   1. https://github.com/zsh-users/zsh/blob/master/Functions/Zle/edit-command-line
autoload -Uz edit-command-line
