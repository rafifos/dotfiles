#!/usr/bin/env sh

# Sets the variable tha tells the system to use 1Password's ssh-agent.
# See: https://developer.1password.com/docs/ssh/agent/compatibility#ssh-auth-sock
export SSH_AUTH_SOCK=~/.1password/agent.sock
