function _deprecate_command --description 'Deprecates a command by printing a message after running it.'
  if status --is-interactive
    set -l command $argv[1]
    set -l alternative $argv[2]

    echo "Deprecation warning: $command is deprecated. Use $alternative instead."
  end
end
