# ~/.zprofile: Sourced by ZSH(1) when starting as a login shell (--login).

# Set $PATH so it includes user's private binaries if it exists.
[[ -d ~/bin ]] && PATH="$HOME/bin:$PATH"
[[ -d ~/.local/bin ]] && PATH="$HOME/.local/bin:$PATH"

# Add Linuxbrew to $PATH if it's installed.
[[ -d /home/linuxbrew/.linuxbrew ]] && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

# Sets the directory of globally installed npm packages to the users $HOME,
# avoiding EACCES errors. Only if npm is installed.
(( $+commands[npm] )) && export NPM_CONFIG_PREFIX="$HOME/.npm-global"