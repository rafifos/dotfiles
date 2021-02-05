# Copyright (c) 2016-present Arctic Ice Studio <development@arcticicestudio.com>
# Copyright (c) 2016-present Sven Greb <development@svengreb.de>
# Copyright (c) 2021 Rafael Julio <development@rafifos.dev>

# Project:    dotfiles
# Repository: https://github.com/rafifos/dotfiles
# License:    MIT

# Sets the path to which the Docker daemon will be installed.
# See:
#   1. https://docs.docker.com/engine/security/rootless/
#   2. https://get.docker.com/rootless
export DOCKER_BIN=$PATH_USER_BIN

# Enable new Docker output formatting.
# See:
#   1. https://docs.docker.com/develop/develop-images/build_enhancements
export DOCKER_BUILDKIT=1
