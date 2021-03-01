# Initializes and configures the "box" prompt theme.
prompt_box_setup() {
  # +------------------------------+
  # + ZSH Options & Configurations +
  # +------------------------------+
  # Enable command substitution and arithmetic expansion in prompts.
  # @see: http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html
  setopt LOCAL_OPTIONS PROMPT_SUBST

  # Enable support for color name mapping to (and from) the ANSI standard eight-color terminal codes.
  # @see: http://zsh.sourceforge.net/Doc/Release/User-Contributions.html#Descriptions
  autoload -Uz colors && colors

  # Allow to add functions to ZSH's hook functions.
  # Added this function in order to always run it when the prompt gets rendered to update included data.
  # @see: http://zsh.sourceforge.net/Doc/Release/User-Contributions.html#Manipulating-Hook-Functions
  # @see: http://zsh.sourceforge.net/Doc/Release/Functions.html#Hook-Functions
  autoload -Uz add-zsh-hook
  add-zsh-hook precmd prompt_box_setup

  # +------------------------+
  # + Git Prompt Integration +
  # +------------------------+
  # The following variables are options to configure Git's prompt support script.
  # @see: https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh

  # Show more information about the identity of commits checked out as a detached HEAD.
  # Control the behavior by setting one of these values:
  #   contains  Relative to newer annotated tag (v1.6.3.2~35)
  #   branch    Relative to newer tag or branch (master~4)
  #   describe  Relative to older annotated tag (v1.6.3.1-13-gdd42c2f)
  #   tag       Relative to any older tag (v1.6.3.1-13-gdd42c2f)
  #   default   Exactly matching tag
  GIT_PS1_DESCRIBE_STYLE=${GIT_PS1_DESCRIBE_STYLE:-describe}

  # Disable `__git_ps1` output when the current working directory is set up to be ignored by Git.
  # Also configurable per repository via `git config bash.hideIfPwdIgnored`.

  GIT_PS1_HIDE_IF_PWD_IGNORED=${GIT_PS1_HIDE_IF_PWD_IGNORED:-false}
  # Show colored hints about the current dirty state.
  # The colors are based on the colored output of `git status -sb`.
  # NOTE: Only available when using `__git_ps1` via ZSH's `precmd` hook function!
  GIT_PS1_SHOWCOLORHINTS=${GIT_PS1_SHOWCOLORHINTS:-true}

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
  GIT_PS1_SHOWUPSTREAM=${GIT_PS1_SHOWUPSTREAM:='auto name verbose'}

  # +--------------------------------+
  # + Theme Options & Configurations +
  # +--------------------------------+
  # By default the name of the host is only shown for remote/SSH sessions.
  # When set to `true` the name will always be shown independent of the current session type.
  IGLOO_ZSH_PROMPT_THEME_ALWAYS_SHOW_HOST=${IGLOO_ZSH_PROMPT_THEME_ALWAYS_SHOW_HOST:-false}

  # By default the name of the user is only shown for remote/SSH sessions.
  # When set to `true` the name will always be shown independent of the current session type.
  IGLOO_ZSH_PROMPT_THEME_ALWAYS_SHOW_USER=${IGLOO_ZSH_PROMPT_THEME_ALWAYS_SHOW_USER:-false}

  # By default the time is always shown.
  # When set to `true` the segment won't be rendered.
  IGLOO_ZSH_PROMPT_THEME_HIDE_TIME=${IGLOO_ZSH_PROMPT_THEME_HIDE_TIME:-false}

  # +-----------------+
  # + Style Constants +
  # +-----------------+
  local c_reset="%b%f%k"
  local nord3="%F{8}"
  local nord7="%F{14}"
  local nord8="%F{6}"
  local nord9="%F{4}"
  local nord11="%F{1}"

  # +----------+
  # + Segments +
  # +----------+
  local seg_exit_status="${c_reset}%(?.%B%F{#2E3440}%K{EBCB8B} %? .)${c_reset}"
  local seg_working_dir="${c_reset}%F{#2E3440}%K{#8FBCBB} %~ ${c_reset}"
  local seg_git

  # Only render the Git segment when the bundled prompt support script has been sourced and the current working
  # directory is actually a Git repository.
  if [[ $(typeset -f __git_ps1) && $(command git rev-parse --is-inside-work-tree 2>/dev/null) == true ]]; then
    local git_branch="$(command git symbolic-ref HEAD 2> /dev/null | sed -e 's|^refs/heads/||')"
    local git_dirty="$(command git status -s --ignore-submodules=dirty 2> /dev/null)"

    if [[ -n $git_branch ]]; then
      if [[ -n $git_dirty ]]; then
        seg_git="${c_reset}%F{#2E3440}%K{#81A1C1} $(__git_ps1 "%s") ${c_reset}"
      else
        seg_git="${c_reset}%F{ECEFF4}%K{#4C566A} $(__git_ps1 "%s") ${c_reset}"
      fi
    fi
  fi

  PROMPT="${seg_exit_status}${seg_working_dir}${seg_git}"
}

prompt_box_setup "$@"
