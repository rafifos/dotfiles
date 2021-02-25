# Create and populate a zkbd compatible hash with terminfo(5) mappings.
# xterm-compatible terminals can use extended key-definitions from user_caps(5).
typeset -g -A key

key[Left]="${terminfo[kcub1]}"
key[Right]="${terminfo[kcuf1]}"
key[Up]="${terminfo[kcuu1]}"
key[Down]="${terminfo[kcud1]}"
key[ShiftTab]="${terminfo[kcbt]}"
key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"
key[Backspace]="${terminfo[kbs]}"
key[Control]='\C-'
key[ControlLeft]='^[[1;5D'
key[ControlRight]='^[[1;5C'
key[Del]="${terminfo[kdch1]}"
key[PageUp]="${terminfo[kpp]}"
key[PageDown]="${terminfo[knp]}"
key[Insert]="${terminfo[kich1]}"

# Character navigation with LEFTARR and RIGHTARR.
[[ -n ${key[Left]} ]] && bindkey -- "${key[Left]}" backward-char
[[ -n ${key[Right]} ]] && bindkey -- "${key[Right]}" forward-char

# Searches through history when pressing UPARR and DOWNARR, also sets it with PGUP and PGDOWN.
[[ -n ${key[Up]} ]] && bindkey -- "${key[Up]}" up-line-or-history
[[ -n ${key[Down]} ]] && bindkey -- "${key[Down]}" down-line-or-history
[[ -n ${key[PageUp]} ]] && bindkey -- "${key[PageUp]}" up-line-or-history
[[ -n ${key[PageDown]} ]] && bindkey -- "${key[PageDown]}" down-line-or-history

# Deletes a character (left-to-right).
[[ -n ${key[Backspace]} ]] && bindkey -- "${key[Backspace]}" backward-delete-char

# Deletes a character (right-to-left).
[[ -n ${key[Del]} ]] && bindkey -- "${key[Del]}" delete-char

# Allows moving to the beginning and end of the line with HOME and END.
[[ -n ${key[Home]} ]] && bindkey -- "${key[Home]}" beginning-of-line
[[ -n ${key[End]} ]] && bindkey -- "${key[End]}" end-of-line

# Toggle between overwrite mode and normal mode.
[[ -n ${key[Insert]} ]] && bindkey -- "${key[Insert]}" overwrite-mode

# Shows the completion menu in reverse order... probably.
[[ -n ${key[ShiftTab]} ]] && bindkey -- "${key[ShiftTab]}" reverse-menu-complete

# Allow to use CTRL + LEFTARR to move to the beginning of the previous word and CTRL + RIGHTARR to move to the beginning
# of the next word.
[[ -n ${key[ControlLeft]} ]] && bindkey -- "${key[ControlLeft]}" backward-word
[[ -n ${key[ControlRight]} ]] && bindkey -- "${key[ControlRight]}" forward-word

#;
# zle_double_dot_expand()
# Expands .. at the beginning, after space, or after any of ! " & ' / ; < > |
# @see: https://github.com/zimfw/input/blob/2f95e2aeed9b4cc3e383adcb41c7a9e8d9f8d89d/init.zsh#L76
#"
function zle_double_dot_expand() {
  if [[ ${LBUFFER} == (|*[[:space:]!\"\&\'/\;\<\>|]).. ]]; then
    LBUFFER+='/..'
  else
    LBUFFER+='.'
  fi
}

# Binds the expansion above to the DOT key.
bindkey '.' zle_double_dot_expand
bindkey -M isearch '.' self-insert

# Allows zle_double_dot_expand() to edit the current line.
zle -N zle_double_dot_expand
