# Copyright (c) 2021 Rafael Julio <hello@rafifos.dev>

# Project:    dotfiles
# Repository: https://github.com/rafifos/dotfiles
# License:    MIT License

# Creates a .zwc (z-word-code) file for every .zsh file in this snowflake.
# This improves the shell startup time since zsh doesn't need to actually parse
# text anymore, and there's also a little control over aliases expansion and
# function autoloading. The caching mechanism is based on what zimfw uses.
# See:
#   1. https://github.com/zsh-users/zsh/blob/master/Functions/Misc/zrecompile
#   2. https://github.com/zimfw/zimfw/blob/master/src/templates/login_init.zsh.erb
#   3. https://www.reddit.com/r/zsh/comments/7f1qpi/how_does_zcompile_work_what_does_it_do_also_how/
#   4. http://zsh.sourceforge.net/Doc/Release/Expansion.html#Glob-Qualifiers

() {
  # There's no need to offload this setopt statement to ./options.zsh since we're
  # also setting LOCAL_OPTIONS, all setopt statements after this will be reverted
  # when the function exists, this is also the reason that this file runs an
  # anonymous function.
  setopt LOCAL_OPTIONS CASE_GLOB EXTENDED_GLOB
  autoload -Uz zrecompile

  local zfile

  # Compile the completion cache; significant speedup
  for zfile in $ZSH_PATH_CACHE/.zcompdump*(N-.); do
    zrecompile -p ${1} ${zdumpfile} || return 1
  done

  # Compile Zsh startup files
  for zfile in $ZDOTDIR/.z(login|logout|profile|shenv|shrc)(N-.); do
    zrecompile -p ${1} ${zfile} || return 1
  done

  # Compile Zsh config files
  for zfile in $ZDOTDIR/config/**/*.zsh(N-.); do
    zrecompile -p ${1} ${zfile} || return 1
  done

  # Compile Zsh lib files
  for zfile in $ZDOTDIR/lib/**/*.zsh(N-.); do
    zrecompile -p ${1} ${zfile} || return 1
  done

  # Compile Zsh pkg files
  for zfile in $ZDOTDIR/pkgs/**/*.zsh(N-.); do
    zrecompile -p ${1} ${zfile} || return 1
  done
}

