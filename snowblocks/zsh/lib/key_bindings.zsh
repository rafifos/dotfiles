# Copyright (c) 2016-present Arctic Ice Studio <development@arcticicestudio.com>
# Copyright (c) 2016-present Sven Greb <development@svengreb.de>
# Copyright (c) 2021 Rafael Julio <hello@rafifos.dev>

# Project:    dotfiles
# Repository: https://github.com/rafifos/dotfiles
# License:    MIT License

# The zshzle(1) (ZSH line editor) key bindings (widgets).
# Simply run `bindkey` without any parameter and options to get a list of currently active widgets.
# See:
#   1. http://zsh.sourceforge.net/Guide/zshguide04.html
#   2. http://zsh.sourceforge.net/Doc/Release/Zsh-Line-Editor.html#Zle-Builtins
#   3. http://zsh.sourceforge.net/Doc/Release/Zsh-Line-Editor.html#Standard-Widgets
#   4. https://wiki.archlinux.org/index.php/zsh#Key_bindings
#   5. https://sgeb.io/posts/2014/04/zsh-zle-custom-widgets/

# Use the default Emacs mode/keymap.
# This also links the `emacs` keymap to `main` so that it is selected by default next time the editor starts.
# See:
#   1. http://zsh.sourceforge.net/Doc/Release/Zsh-Line-Editor.html#index-bindkey
bindkey -e

# Make sure the terminal is in application mode when the ZSH line editor zle is active.
# otherwise values from `$terminfo` are not valid.
if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
  function zle_application_mode_start { echoti smkx }
  function zle_application_mode_stop { echoti rmkx }

  autoload -Uz add-zle-hook-widget
  add-zle-hook-widget -Uz line-init zle_application_mode_start
  add-zle-hook-widget -Uz line-finish zle_application_mode_stop
fi

# Create and populate a zkbd compatible hash with terminfo(5) mappings.
# xterm-compatible terminals can use extended key-definitions from user_caps(5).
# Those are combinations of [⇧ Shift], and [Ctrl] together with [↑ Up],
# [↓ Down], [← Left], [→ Right], [Page Up], [Page Down], [⇱ Home], [⇲ End]
# or [Del].
# See:
#   1. [← Left]/[→ Right]/[↑ Up]/[↓ Down] U+2190/U+2192/U+2191/U+2193 (https://en.wikipedia.org/wiki/Arrow_keys)
#   2. [↹ Tab] U+21B9 (https://en.wikipedia.org/wiki/Tab_key)
#   3. [⇧ Shift] U+21E7 (https://en.wikipedia.org/wiki/Shift_key)
#   4. [⇱ Home] U+21F1 (https://en.wikipedia.org/wiki/Home_key)
#   5. [⇲ End] U+21F2 (https://en.wikipedia.org/wiki/End_key)
#   6. [⌫ Backspace] U+232B (https://en.wikipedia.org/wiki/Backspace)
#   7. [^ Ctrl]/[Control] (https://en.wikipedia.org/wiki/Control_key)
#   8. [Del] (https://en.wikipedia.org/wiki/Delete_key)
#   9. [Page Up]/[Page Down] (https://en.wikipedia.org/wiki/Page_Up_and_Page_Down_keys)
#  10. [Insert] (https://en.wikipedia.org/wiki/Insert_key)
typeset -g -A key

key[Left]="${terminfo[kcub1]}"
key[Right]="${terminfo[kcuf1]}"
key[Up]="${terminfo[kcuu1]}"
key[Down]="${terminfo[kcud1]}"
key[Shift-Tab]="${terminfo[kcbt]}"
key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"
key[Backspace]="${terminfo[kbs]}"
key[Control]='\C-'
key[Control-Left]='^[[1;5D'
key[Control-Right]='^[[1;5C'
key[Delete]="${terminfo[kdch1]}"
key[Page-Up]="${terminfo[kpp]}"
key[Page-Down]="${terminfo[knp]}"
key[Insert]="${terminfo[kich1]}"

# <Ctrl-x><Ctrl-e> to edit command-line in EDITOR
autoload -Uz edit-command-line
zle -N edit-command-line
[[ -n "${key[Control]}" ]] && bindkey -- "${key[Control]}x${key[Control]}e" edit-command-line

# Smart URL pasting and escaping.
autoload -Uz bracketed-paste-url-magic url-quote-magic
zle -N bracketed-paste 
zle -N bracketed-paste-url-magic
# zle -N self-insert
zle -N url-quote-magic

zle_double_dot_expand() {
  # Expand .. at the beginning, after space, or after any of ! " & ' / ; < > |
  if [[ ${LBUFFER} == (|*[[:space:]!\"\&\'/\;\<\>|]).. ]]; then
    LBUFFER+='/..'
  else
    LBUFFER+='.'
  fi
}

zle -N zle_double_dot_expand
bindkey '.' zle_double_dot_expand
bindkey -M isearch '.' self-insert

# Autoload required widgets.
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

[[ -n "${key[Backspace]}" ]] && bindkey -- "${key[Backspace]}" backward-delete-char
[[ -n "${key[Delete]}" ]] && bindkey -- "${key[Delete]}" delete-char
[[ -n "${key[Home]}" ]] && bindkey -- "${key[Home]}" beginning-of-line
[[ -n "${key[End]}" ]] && bindkey -- "${key[End]}" end-of-line
[[ -n "${key[Page-Up]}" ]] && bindkey -- "${key[Page-Up]}" up-line-or-history
[[ -n "${key[Page-Down]}" ]] && bindkey -- "${key[Page-Down]}" down-line-or-history
[[ -n "${key[Insert]}" ]] && bindkey -- "${key[Insert]}" overwrite-mode
[[ -n "${key[Up]}" ]] && bindkey -- "${key[Up]}" up-line-or-history
[[ -n "${key[Down]}" ]] && bindkey -- "${key[Down]}" down-line-or-history
[[ -n "${key[Left]}" ]] && bindkey -- "${key[Left]}" backward-char
[[ -n "${key[Right]}" ]] && bindkey -- "${key[Right]}" forward-char
[[ -n "${key[Shift-Tab]}" ]] && bindkey -- "${key[Shift-Tab]}" reverse-menu-complete

# Allow to only show the past history events matching the current line up to the current
# cursor position will be shown when ↑ or ↓ keys are pressed.
[[ -n "${key[Up]}" ]] && bindkey -- "${key[Up]}" up-line-or-beginning-search
[[ -n "${key[Down]}" ]] && bindkey -- "${key[Down]}" down-line-or-beginning-search

# Allow to use ^← to move to the beginning of the previous word and ^→ to move to
# the beginning of the next word.
[[ -n "${key[Control-Left]}" ]] && bindkey -- "${key[Control-Left]}" backward-word
[[ -n "${key[Control-Right]}" ]] && bindkey -- "${key[Control-Right]}" forward-word
