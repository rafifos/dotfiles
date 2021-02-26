# Universal variables, this should only run once.
if not type -q universal_variables_set
    # Sets the XDG Base Directory Specification directories if they're not set.
    set -q XDG_CONFIG_HOME; or set -U XDG_CONFIG_HOME $HOME/.config
    set -q XDG_CACHE_HOME; or set -U XDG_CACHE_HOME $HOME/.cache
    set -q XDG_DATA_HOME; or set -U XDG_DATA_HOME $HOME/.local/share

    # Sets fish's config and data directories.
    set -U __fish_user_data_dir $XDG_DATA_HOME/fish
    set -U __fish_user_config_dir $XDG_CONFIG_HOME/fish

    # Forces 24bit support for the current session.
    set -U fish_term24bit 1

    # An arctic, north-bluish color scheme.
    set -U fish_color_normal ECEFF4
    set -U fish_color_command 88C0D0
    set -U fish_color_quote A3BE8C
    set -U fish_color_redirection B48EAD
    set -U fish_color_end D08770
    set -U fish_color_error EBCB8B
    set -U fish_color_param E5E9F0
    set -U fish_color_comment 4C566A
    set -U fish_color_match 434C5E --background=D8DEE9
    set -U fish_color_selection 434C5E --background=D8DEE9
    set -U fish_color_search_match 434C5E --background=D8DEE9
    set -U fish_color_operator 81A1C1
    set -U fish_color_escape EBCB8B
    set -U fish_color_cwd 8FBCBB
    set -U fish_color_autosuggestion 3B4252
    set -U fish_color_user 81A1C1
    set -U fish_color_host 81A1C1
    set -U fish_color_host_remote 81A1C1
    set -U fish_color_cancel -r
    set -U fish_pager_color_progress normal --background=8FBCBB
    set -U fish_pager_color_background normal
    set -U fish_pager_color_prefix normal --bold --underline
    set -U fish_pager_color_completion 3B4252
    set -U fish_pager_color_description 2E3440 --background=ECEFF4

    # Additional variables used by the default theme.
    set -U fish_color_history_current --bold
    set -U fish_color_cwd_root 8FBCBB --bold
    set -U fish_color_valid_path --underline

    # Set the terminfo capability substrings for the color environment variable interpreted by the
    # "termcap" compatibility application interface.
    #
    # fn - File names prefixing any content line.
    # ln - Line numbers prefixing any content line.
    # mt - Matching non-empty text in any matching line.
    # se - Separators that are inserted between selected line fields (`:`), context line fields (`-`) and
    #      groups of adjacent lines when nonzero context is specified (`--`)
    # See:
    #   1. http://www.gnu.org/software/grep/manual/grep.html
    #   2. terminfo(5)
    set -Ux GREP_COLORS 'fn=34:ln=01;30:mt=01;34:se=30'

    # Set's "Portuguese (Brazil)" as the fallback language.
    not type -q LC_ALL; or set -Ux LC_ALL pt_BR.UTF-8

    # Pass options by default to...
    # - only display ANSI "color" escape sequences in "raw" form (`-R`, `--RAW-CONTROL-CHARS`)
    # - automatically exit if the entire file can be displayed on the first screen (`-F`, `--quit-if-one-screen`)
    # - disable sending the termcap (de)initialization strings to the terminal to avoid unnecessary operations like
    #   clearing the screen (`-X`, `--no-init`)
    # - use two tab stops (`-x2`, `--tabs=n`)
    set -Ux LESS -RFXx2

    # Set's the charset to UTF-8.
    set -Ux LESSCHARSET utf-8

    # Set the terminfo variables of the "termcap" compatibility application interface.
    # Provides colored output for the `man` command.
    #
    # Escape Sequences Comparison Table
    # ==================================
    # termcap  terminfo  function
    # -------  --------  --------
    # ks       smkx      Send commands via keypad
    # ke       rmkx      Send digits via keypad
    # vb       flash     Emit visual bell
    # mb       blink     Start blink
    # md       bold      Start bold
    # me       sgr0      Turn off bold, blink and underline
    # so       smso      Start standout (reverse video)
    # se       rmso      Stop standout
    # us       smul      Start underline
    # ue       rmul      Stop underline
    #
    # See:
    #   1. https://www.gnu.org/software/less
    #   2. terminfo(5)
    set -Ux LESS_TERMCAP_mb \e\[01\X3B34m
    set -Ux LESS_TERMCAP_md \e\[01\X3B34m
    set -Ux LESS_TERMCAP_me \e\[0m
    set -Ux LESS_TERMCAP_so \e\[01\X3B30m
    set -Ux LESS_TERMCAP_se \e\[0m
    set -Ux LESS_TERMCAP_us \e\[01\X3B34m
    set -Ux LESS_TERMCAP_ue \e\[0m

    # Set the style of the sudo prompt.
    # See: sudo(8)
    set -Ux SUDO_PROMPT (set_color 2E3440 --background $fish_color_error; echo -n ' ! '; set_color --background D08770; echo -n " sudo "; set_color normal; echo -n ' ')

    # Set's the output of various programs to use the ISO 8601 format.
    # See: https://www.gnu.org/software/coreutils/manual/html_node/Formatting-file-timestamps.html
    set -Ux TIME_STYLE iso

    # This is the magic line that makes this block only run once per machine.
    set -U universal_variables_set true
end

# Loads Homebrew if it's available.
test -d ~/.linuxbrew; and eval (~/.linuxbrew/bin/brew shellenv)
test -d /home/linuxbrew/.linuxbrew; and eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)

# Enables BuildKit.
# See: https://docs.docker.com/develop/develop-images/build_enhancements
type -q docker; and set -gx DOCKER_BUILDKIT 1

# Environment variables for interactive shells.
if status --is-interactive
    # An arctic, north-bluish clean and elegant dircolors theme.
    test -f $__fish_user_config_dir/lib/nord-dircolors/src/dir_colors; and eval (dircolors -c $__fish_user_config_dir/lib/nord-dircolors/src/dir_colors)

    # forgit options.
    # See: https://github.com/wfxr/forgit#--options
    if type -q bat
        set -gx FORGIT_PAGER 'bat --color always'
        set -gx FORGIT_IGNORE_PAGER 'bat -l gitignore --color always'
    end

    # enhancd configurations.
    # See:
    if type -q enhancd
        # The number of directories that enhancd will recurse into.
        set -gx ENHANCD_HYPHEN_NUM 16

        # Completions to be generated.
        set -gx ENHANCD_COMPLETION_BEHAVIOR list,history

        # Set's enhancd filter to fzf if available.
        type -q fzf; and set -gx ENHANCD_FILTER fzf
    end

    # fzf environment variables.
    # See: https://github.com/jethrokuan/fzf#variables
    if type -q fzf
        # Use fzf in fullscreen mode with command line at the bottom, allow to cycle through results when moving out
        # of range at the bottom or start and always use 2 spaces for tab stops.
        set -gx FZF_DEFAULT_OPTS --no-height --no-reverse --cycle --tabstop=2

        # Adjust the colors to match the "Nord" theme.
        # See: https://www.nordtheme.com
        set FZF_DEFAULT_OPTS $FZF_DEFAULT_OPTS --color bg:'#2E3440',bg+:'#4C566A',fg:'#E5E9F0'
        set FZF_DEFAULT_OPTS $FZF_DEFAULT_OPTS --color fg+:'#ECEFF4',hl:'#88C0D0',hl+:'#81A1C1'
        set FZF_DEFAULT_OPTS $FZF_DEFAULT_OPTS --color preview-bg:'#2E3440',preview-fg:'#E5E9F0'
        set FZF_DEFAULT_OPTS $FZF_DEFAULT_OPTS --color border:'#4C566A',gutter:'#3B4252',header:'#88C0D0'
        set FZF_DEFAULT_OPTS $FZF_DEFAULT_OPTS --color info:'#88C0D0',marker:'#88C0D0',pointer:'#81A1C1'
        set FZF_DEFAULT_OPTS $FZF_DEFAULT_OPTS --color prompt:'#88C0D0',spinner:'#88C0D0'

        # Exports the default fzf options.
        set -gx FZF_DEFAULT_OPTS $FZF_DEFAULT_OPTS

        # Options to fzf completions.
        set -gx FZF_COMPLETION_OPTS '+c -x'
    end

    # Makes fzf use fd to find files and directories by default.
    if type -q fd
        set -gx FZF_DEFAULT_COMMAND 'fd --type f --hidden --follow --exclude .git'

        # Also sets the default command to the ^T key binding.
        set -gx FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND
    end

    # Sets nvim as the default editor if it's installed.
    if type -q nvim
        set -gx EDITOR nvim
        set -gx VISUAL $EDITOR
        set -gx MANPAGER 'nvim -R +MANPAGER -'
    end

    # Load the VTE shell profile configuration to enable inheritance of the current working directory
    # when opening a new terminal tab or splitting the current one.
    # The script is necessary since some Linux distributions like Arch Linux only execute scripts in
    # `/etc/profile.d` for login shells while not for non-login based shells which results in the state
    # that the current directory is nve reported by VTE. This means when splitting terminals in Tilix
    # instead of inheriting the directory from the current terminal the split terminal always opens in
    # the home path of the current user.
    # See: https://gnunn1.github.io/tilix-web/manual/vteconfig
    if test -q $TILIX_ID; or test -d $VTE_VERSION; and test -f /etc/profile.d/vte.sh
        replay 'source /etc/profile.d/vte.sh'
    end

    # Workaround for handling TERM variable in multiple tmux sessions properly.
    # See: http://sourceforge.net/p/tmux/mailman/message/32751663
    if test -q $TMUX; and type -q tmux
        switch (tmux showenv TERM 2>/dev/null)
            case '*256color'
                set -g TERM screen-256color
            case '*'
                set -g TERM screen
        end

        tmux attach -t TMUX; or tmux new -s TMUX
    end
end
