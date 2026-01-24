function _last_history_item -d 'Gets the last history item. See: https://github.com/fish-shell/fish-shell/wiki/Bash-Style-Command-Substitution-and-Chaining-(!!-!$)'
  echo $history[1];
end
