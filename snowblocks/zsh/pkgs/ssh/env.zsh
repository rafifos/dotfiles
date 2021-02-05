# Copyright (c) 2016-present Arctic Ice Studio <development@arcticicestudio.com>
# Copyright (c) 2016-present Sven Greb <development@svengreb.de>
# Copyright (c) 2021 Rafael Julio <development@rafifos.dev>

# Project:    dotfiles
# Repository: https://github.com/rafifos/dotfiles
# License:    MIT

# See https://wiki.archlinux.org/index.php/SSH_keys#SSH_agents for more details about the setup
# of the ssh-agent with systemd.
export SSH_AUTH_SOCK=$XDG_RUNTIME_DIR/ssh-agent.socket
