# Copyright (c) 2016-present Arctic Ice Studio <development@arcticicestudio.com>
# Copyright (c) 2016-present Sven Greb <development@svengreb.de>
# Copyright (c) 2021 Rafael Julio <hello@rafifos.dev>

# Project:    dotfiles
# Repository: https://github.com/rafifos/dotfiles
# License:    MIT License

# See https://wiki.archlinux.org/index.php/GNOME/Keyring#Disable_keyring_daemon_components to learn
# more about the need of this environment variable when using the OpenSSH agent with GNOME.
export GSM_SKIP_SSH_AGENT_WORKAROUND=1
