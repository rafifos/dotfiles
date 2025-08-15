function remove_path --description 'Remove a directory from $PATH variable'
  if set -l index (contains -i "$argv" $fish_user_paths)
    set -e fish_user_paths[$index]

    echo "Removed $argv from the path"
  end
end
