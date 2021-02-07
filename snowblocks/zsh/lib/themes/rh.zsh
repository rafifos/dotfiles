# Copyright (c) 2021 Rafael Julio <hello@rafifos.dev>

# Project:    dotfiles
# Repository: https://github.com/rafifos/dotfiles
# License:    MIT License

# Simple Zsh theme loosely based on rh with various bits and logic from
# arcticicestudio's "igloo" theme. Only usable when inside this repository, but
# it's very simple to port.

# Initializes and configures the "rh" prompt theme.
prompt_rh_setup() {
  # +------------------------------+
  # + ZSH Options & Configurations +
  # +------------------------------+
  # Enable command substitution and arithmetic expansion in prompts.
  # See:
  #   1. http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html
  setopt LOCAL_OPTIONS PROMPT_SUBST

  use_nord_colors

  # Allow to add functions to ZSH's hook functions.
  # Added this function in order to always run it when the prompt gets rendered to update included data.
  # See:
  #   1. http://zsh.sourceforge.net/Doc/Release/User-Contributions.html#Manipulating-Hook-Functions
  #   2. http://zsh.sourceforge.net/Doc/Release/Functions.html#Hook-Functions
  autoload -Uz add-zsh-hook
  add-zsh-hook precmd prompt_rh_setup

  # +------------------------+
  # + Git Prompt Integration +
  # +------------------------+
  # The following variables are options to configure Git's prompt support script.
  # See:
  #   1. https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh

  # Show unstaged (*) and staged (+) changes.
  # Also configurable per repository via `git config bash.showDirtyState`.
  GIT_PS1_SHOWDIRTYSTATE=${GIT_PS1_SHOWDIRTYSTATE:-true}

  # Show currently stashed ($) changes.
  GIT_PS1_SHOWSTASHSTATE=${GIT_PS1_SHOWSTASHSTATE:-true}

  # Show untracked (%) changes.
  # Also configurable per repository via `git config bash.showUntrackedFiles`.
  GIT_PS1_SHOWUNTRACKEDFILES=${GIT_PS1_SHOWUNTRACKEDFILES:-true}

  # Show indicators for difference between HEAD and its upstream.
  #
  # <  Behind upstream
  # >  Ahead upstream
  # <> Diverged upstream
  # =  Equal upstream
  #
  # Control behavior by setting to a space-separated list of values:
  #   auto     Automatically show indicators
  #   verbose  Show number of commits ahead/behind (+/-) upstream
  #   name     If verbose, then also show the upstream abbrev name
  #   legacy   Do not use the '--count' option available in recent versions of git-rev-list
  #   git      Always compare HEAD to @{upstream}
  #   svn      Always compare HEAD to your SVN upstream
  #
  # By default, `__git_ps1` will compare HEAD to SVN upstream (`@{upstream}` if not available).
  # Also configurable per repository via `git config bash.showUpstream`.
  GIT_PS1_SHOWUPSTREAM=${GIT_PS1_SHOWUPSTREAM:="auto"}

  # When the repository has a sparse-checkout, a notification of the form
  # "|SPARSE" will be included in the prompt.  This can be shortened to a
  # single '?' character by setting GIT_PS1_COMPRESSSPARSESTATE.
  GIT_PS1_COMPRESSSPARSESTATE=${GIT_PS1_COMPRESSSPARSESTATE:=true}

  # Show more information about the identity of commits checked out as a detached HEAD.
  # Control the behavior by setting one of these values:
  #   contains  Relative to newer annotated tag (v1.6.3.2~35)
  #   branch    Relative to newer tag or branch (master~4)
  #   describe  Relative to older annotated tag (v1.6.3.1-13-gdd42c2f)
  #   tag       Relative to any older tag (v1.6.3.1-13-gdd42c2f)
  #   default   Exactly matching tag
  GIT_PS1_DESCRIBE_STYLE=${GIT_PS1_DESCRIBE_STYLE:-branch}

  # Show colored hints about the current dirty state.
  # The colors are based on the colored output of `git status -sb`.
  # NOTE: Only available when using `__git_ps1` via ZSH's `precmd` hook function!
  GIT_PS1_SHOWCOLORHINTS=${GIT_PS1_SHOWCOLORHINTS:-true}

  # Disable `__git_ps1` output when the current working directory is set up to be ignored by Git.
  # Also configurable per repository via `git config bash.hideIfPwdIgnored`.
  GIT_PS1_HIDE_IF_PWD_IGNORED=${GIT_PS1_HIDE_IF_PWD_IGNORED:-$(true)}

  # +-----------------+
  # + Style Constants +
  # +-----------------+
  local c_reset="%b%f%k"
  local newline=$'\n'
  local nord1="%F{$ZSH_NORD_COLORS[1]}"
  local nord2="%F{$ZSH_NORD_COLORS[2]}"
  local nord3="%F{$ZSH_NORD_COLORS[3]}"
  local nord4="%F{$ZSH_NORD_COLORS[4]}"
  local nord5="%F{$ZSH_NORD_COLORS[5]}"
  local nord6="%F{$ZSH_NORD_COLORS[6]}"
  local nord7="%F{$ZSH_NORD_COLORS[7]}"
  local nord8="%F{$ZSH_NORD_COLORS[8]}"
  local nord9="%F{$ZSH_NORD_COLORS[9]}"
  local nord10="%F{$ZSH_NORD_COLORS[10]}"
  local nord11="%F{$ZSH_NORD_COLORS[11]}"
  local nord12="%F{$ZSH_NORD_COLORS[12]}"
  local nord13="%F{$ZSH_NORD_COLORS[13]}"
  local nord14="%F{$ZSH_NORD_COLORS[14]}"
  local nord15="%F{$ZSH_NORD_COLORS[15]}"
  local nord_comment="%F{$ZSH_NORD_COLORS[comment]}"

  # +----------+
  # + Segments +
  # +----------+
  local seg_user="%(!.%B${nord11}.${nord15})%n${c_reset}"
  local seg_working_dir="%{${nord8}%}%48<...<%~%<<${c_reset}"
  local seg_exit_status="%(?..${nord3}{%(?.${nord9}.${nord11})%?${nord3}})${c_reset}"

  local seg_git
  # Only render the Git segment when the bundled prompt support script has been sourced and the current working
  # directory is actually a Git repository.
  if [[ $(typeset -f __git_ps1) && $(command git rev-parse --is-inside-work-tree 2>/dev/null) == true ]]; then
    local git_commit_short="$(command git rev-parse --short HEAD 2>/dev/null)"
    seg_git="${nord3}(${nord14}$(__git_ps1 "%s") ${nord_comment}${git_commit_short}${nord3})${c_reset}"
  fi

  PROMPT="${nord3}[${seg_user}:${seg_working_dir}${nord3}]${c_reset} "
  RPROMPT="${seg_git} ${seg_exit_status}"
}

prompt_rh_setup "$@"
