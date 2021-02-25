function mkd --description "Creates a directory and enters it."
    set -l dir "$argv[1]"

    if not test -d "$dir"
        mkdir -p "$dir"
    end

    cd "$dir"
end
