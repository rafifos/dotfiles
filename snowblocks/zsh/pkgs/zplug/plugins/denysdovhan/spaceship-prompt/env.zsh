# Copyright (c) 2021 Rafael Julio <hello@rafifos.dev>

# Project:    dotfiles
# Repository: https://github.com/rafifos/dotfiles
# License:    MIT License

# Configurations for the "denysdovhan/spaceship-prompt" theme.
# See:
#   1. https://github.com/denysdovhan/spaceship-prompt/blob/master/docs/Options.md

# +--- Order ---+
# See:
#   1. https://github.com/denysdovhan/spaceship-prompt/blob/master/docs/Options.md#order

export SPACESHIP_PROMPT_ORDER=(
  # time      # Time stamps section
  user        # Username section
  dir         # Current directory section
  host        # Hostname section
  git         # Git section (git_branch + git_status)
  # hg        # Mercurial section (hg_branch  + hg_status)
  package     # Package version
  node        # Node.js section
  # ruby      # Ruby section
  # elixir    # Elixir section
  # xcode     # Xcode section
  # swift     # Swift section
  # golang    # Go section
  # php       # PHP section
  # rust      # Rust section
  # haskell   # Haskell Stack section
  # julia     # Julia section
  docker      # Docker section
  # aws       # Amazon Web Services section
  # gcloud    # Google Cloud Platform section
  # venv      # virtualenv section
  # conda     # conda virtualenv section
  # pyenv     # Pyenv section
  # dotnet    # .NET section
  # ember     # Ember.js section
  # kubectl   # Kubectl context section
  # terraform # Terraform workspace section
  exec_time   # Execution time
  line_sep    # Line break
  battery     # Battery level and status
  vi_mode     # Vi-mode indicator
  jobs        # Background jobs indicator
  exit_code   # Exit code section
  char        # Prompt character
)

# +--- Username ---+
# See:
#   1. https://github.com/denysdovhan/spaceship-prompt/blob/master/docs/Options.md#username-user
export SPACESHIP_USER_SHOW=always

# +--- Hostname ---+
# See:
#   1. https://github.com/denysdovhan/spaceship-prompt/blob/master/docs/Options.md#hostname-host
export SPACESHIP_HOST_SHOW=always

# +--- Docker ---+
# See:
#   1. https://github.com/denysdovhan/spaceship-prompt/blob/master/docs/Options.md#docker-docker
export SPACESHIP_DOCKER_VERBOSE=true

# +--- Battery ---+
# See:
#   1. https://github.com/denysdovhan/spaceship-prompt/blob/master/docs/Options.md#battery-battery
export SPACESHIP_BATTERY_THRESHOLD=40

# +--- Exit code ---+
# See:
#   1. https://github.com/denysdovhan/spaceship-prompt/blob/master/docs/Options.md#exit-code-exit_code
export SPACESHIP_EXIT_CODE_SHOW=true