# Binds the UPARR and DOWNARR keys to history-substring-search.
[[ -n ${key[Up]} ]] && bindkey -- "${key[Up]}" history-substring-search-up
[[ -n ${key[Down]} ]] && bindkey -- "${key[Down]}" history-substring-search-down

# Binds the PGUP and PGDOWN keys to history-substring-search.
[[ -n ${key[PageUp]} ]] && bindkey -- "${key[PageUp]}" history-substring-search-up
[[ -n ${key[PageDown]} ]] && bindkey -- "${key[PageDown]}" history-substring-search-down
