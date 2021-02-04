# Copyright (c) 2021 Rafael Julio <hello@rafifos.dev>
#
# Project:    dotfiles
# Repository: https://github.com/rafifos/dotfiles
# License:    MIT License

# Installs the Docker daemon in rootless mode. (If it isn't already installed).
# See:
#   1. https://docs.docker.com/engine/security/rootless/
#   2. https://get.docker.com/rootless
if ! type docker >/dev/null; then
  curl -fsSL "https://get.docker.com/rootless" | $DOCKER_BIN sh
fi
