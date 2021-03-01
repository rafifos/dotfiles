# Loads all files that ends with `.zsh` under the etc folder.
# @note: This requires the EXTENDED_GLOB option to be set.
source $ZDOTDIR/etc/**/*.zsh(N)

# Local configurations for optional commands.
(( $+commands[exa] )) && source $ZDOTDIR/opt/exa/*.zsh
(( $+commands[fzf] )) && source $ZDOTDIR/opt/fzf/*.zsh
(( $+commands[httpie] )) && source $ZDOTDIR/opt/httpie/*.zsh
(( $+commands[rip] )) && source $ZDOTDIR/opt/rip/*.zsh
(( $+commands[ripgrep] )) && source $ZDOTDIR/opt/ripgrep/*.zsh
(( $+commands[rsync] )) && source $ZDOTDIR/opt/rsync/*.zsh
(( $+commands[tmux] )) && source $ZDOTDIR/opt/tmux/*.zsh
(( $+commands[dircolors] )) && source $ZDOTDIR/opt/dircolors/*.zsh

# Remote plugins.
antigen bundles <<EOBUNDLES
  # Enhances the terminal environment with 256 colors.
  chrissicool/zsh-256color

  # Colorize the output of various programs.
  zpm-zsh/colorize

  # docker and docker-compose completions.
  greymd/docker-zsh-completion

  # Better completion for npm.
  lukechilds/zsh-better-npm-completion

  # Additional completions for Zsh.
  zsh-users/zsh-completions

  # Adds start, restart, stop, up and down commands when it detects a docker-compose or Vagrantfile in CWD.
  Cloudstek/zsh-plugin-appup

  # Clears previous command output every time before new command executed in shell.
  Valiev/almostontop

  # Automatically sends out a notification when a long running task has completed.
  MichaelAquilina/zsh-auto-notify

  # A zsh plugin that reminds you that you should use one of your existing aliases for a command you just typed.
  MichaelAquilina/zsh-you-should-use

  # A tool designed to help you use git more efficiently.
  wfxr/forgit

  # Replace zsh's default completion selection menu with fzf!
  Aloxaf/fzf-tab

  # A next-generation cd command with an interactive filter ✨
  b4b4r07/enhancd

  # 🐠 ZSH port of Fish history search (up arrow).
  zsh-users/zsh-history-substring-search

  # Feature rich syntax highlighting for Zsh.
  zsh-users/zsh-syntax-highlighting

  # Fish-like fast/unobtrusive autosuggestions for zsh.
  zsh-users/zsh-autosuggestions

  # A plugin that auto-closes, deletes and skips over matching delimiters in zsh intelligently. Hopefully.
  # @note: This should always come last (even after zsh-completions).
  hlissner/zsh-autopair
EOBUNDLES

# Load the ohmyzsh's library.
antigen use ohmyzsh/ohmyzsh

# Bundles ohmyzsh plugins.
antigen bundles <<EOBUNDLES
  adb
  cp
  git-extras
  httpie
  httpie
  rsync
  safe-paste
  ssh-agent
  yarn
EOBUNDLES

# Load the Prezto library.
antigen use prezto

# Bundles Prezto modules.
antigen bundles <<EOBUNDLES
  sorin-ionescu/prezto modules/archive
  sorin-ionescu/prezto modules/command-not-found
EOBUNDLES

# Sets the prompt theme. The shell is fully set up at this point.
source $ZDOTDIR/usr/share/themes/box/prompt.zsh
autoload -Uz promptinit prompt_box_setup && promptinit
prompt box

# Apply antigen statements.
antigen apply
