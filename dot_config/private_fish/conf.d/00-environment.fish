# Sets the HOSTNAME if fish doesn't inherits it.
set -q HOSTNAME; or set -Ux HOSTNAME (hostname)

# Set's "Portuguese (Brazil)" as the fallback language.
# See: https://www.gnu.org/software/gettext/manual/html_node/Locale-Environment-Variables.html
set -q LC_ALL; and set -e LC_ALL
set -Ux LANG pt_BR.UTF-8

# Set's the output of various programs to use the ISO 8601 format.
# See: https://www.gnu.org/software/coreutils/manual/html_node/Formatting-file-timestamps.html
set -Ux TIME_STYLE iso

# Sets the XDG Base Directory Specification directories.
# See: https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
set -Ux XDG_CACHE_HOME $HOME/.cache
set -Ux XDG_CONFIG_HOME $HOME/.config
set -Ux XDG_RUNTIME_DIR $HOME/.local/run
set -Ux XDG_STATE_HOME $HOME/.local/state
set -Ux XDG_DATA_HOME $HOME/.local/share

# Also appends the applicable directories to XDG_CONFIG_DIRS and XDG_DATA_DIRS.
set -Ua XDG_CONFIG_DIRS $XDG_CONFIG_HOME
set -Ua XDG_DATA_DIRS $XDG_DATA_HOME

# Sets fish's config and data directories.
set -U __fish_user_data_dir $XDG_DATA_HOME/fish
set -U __fish_user_config_dir $XDG_CONFIG_HOME/fish

# Many programs try to parse the SHELL variable but fail miserably to do so. Tell them we're using fish.
set -Ux SHELL $__fish_bin_dir/fish

# Loads Homebrew if it's available.
test -d ~/.linuxbrew; and eval (~/.linuxbrew/bin/brew shellenv)
test -d /home/linuxbrew/.linuxbrew; and eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)

# Prepends local binary directory if it's present.
test -d ~/.local/bin; and fish_add_path ~/.local/bin

# Enables Docker BuildKit.
# See: https://docs.docker.com/develop/develop-images/build_enhancements
type -q docker; and set -Ux DOCKER_BUILDKIT 1

# Node.js configurations
# See: https://nodejs.org/api/cli.html#cli_environment_variables
set -Ux NODE_PRESERVE_SYMLINKS 1

# Environment variables for interactive shells.
if status --is-interactive
    # An arctic, north-bluish color scheme.
    set -l nord0 2E3440
    set -l nord1 3B4252
    set -l nord2 434C5E
    set -l nord3 4C566A
    set -l nord4 D8DEE9
    set -l nord5 E5E9F0
    set -l nord6 ECEFF4
    set -l nord7 8FBCBB
    set -l nord8 88C0D0
    set -l nord9 81A1C1
    set -l nord10 5E81AC
    set -l nord11 BF616A
    set -l nord12 D08770
    set -l nord13 EBCB8B
    set -l nord14 A3BE8C
    set -l nord15 B48EAD

    # default color
    set -U fish_color_normal normal

    # commands like echo
    set -U fish_color_command $nord9

    # keywords like if - this falls back on the command color if unset
    set -U fish_color_keyword $nord9

    # quoted text like abc
    set -U fish_color_quote $nord14

    # IO redirections like >/dev/null
    set -U fish_color_redirection $nord15

    # process separators like; and &
    set -U fish_color_end $nord8

    # syntax errors
    set -U fish_color_error $nord13

    # ordinary command parameters
    set -U fish_color_param $nord6

    # options starting with “-”, up to the first “--” parameter
    set -U fish_color_option $nord6

    # comments like ‘# important’
    set -U fish_color_comment $nord3

    # selected text in vi visual mode
    set -U fish_color_selection white --bold --background=brblack

    # parameter expansion operators like * and ~
    set -U fish_color_operator $nord9

    # character escapes like \n and \x70
    set -U fish_color_escape $nord13

    # autosuggestions (the proposed rest of a command)
    set -U fish_color_autosuggestion $nord1

    # the current working directory in the default prompt
    set -U fish_color_cwd green

    # the username in the default prompt
    set -U fish_color_user brgreen

    # the hostname in the default prompt
    set -U fish_color_host normal

    # the hostname in the default prompt for remote sessions (like ssh)
    set -U fish_color_host_remote normal

    # the ‘^C’ indicator on a canceled command
    set -U fish_color_cancel -r

    # history search matches and selected pager items (background only)
    set -U fish_color_search_match bryellow --background=brblack # todo

    # the progress bar at the bottom left corner
    set -U fish_pager_color_progress brwhite --background=cyan

    # the prefix string, i.e. the string that is to be completed
    set -U fish_pager_color_prefix normal --bold --underline

    # the completion itself, i.e. the proposed rest of the string
    set -U fish_pager_color_completion normal

    # the completion description
    set -U fish_pager_color_description $nord13 yellow

    # background of the selected completion
    set -U fish_pager_color_selected_background --background=brblack

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

    # Set the path to the UNIX socket used by ssh to communicate with 1Password.
    # See:
    #   1. ssh(1)
    #   2. https://developer.1password.com/docs/ssh/get-started#step-4-configure-your-ssh-or-git-client
    set -Ux SSH_AUTH_SOCK ~/.1password/agent.sock

    # Set the style of the sudo prompt.
    # See: sudo(8)
    set -Ux SUDO_PROMPT (set_color $nord0 --background $fish_color_error; echo -n ' ! '; set_color --background $nord11; echo -n " sudo "; set_color normal; echo -n ' ')

    # Configure pinentry to use the correct TTY.
    # See: https://wiki.archlinux.org/title/GnuPG#:~:text=gpg-agent%20%5B3%5D.-,Configure%20pinentry%20to%20use%20the%20correct%20TTY,-Also%20set%20the
    set -gx GPG_TTY (tty)

    # Additional command colorizers for grc.
    # See:
    #   1. http://www.gnu.org/software/grc/manual/html_node/Colorizing-Output.html
    #   2. https://github.com/oh-my-fish/plugin-grc
    #   3. https://github.com/zpm-zsh/colorize
    set -U grc_plugin_execs as cvs df dig du env free g++ gas gcc ifconfig last ld lsblk make mount mtr netstat ping ping6 ps tail traceroute wdiff

    # Sets helix as the default editor if it's installed.
    if type -q hx
        set -Ux EDITOR hx
    end

    # An arctic, north-bluish clean and elegant dircolors theme.
    test -f $__fish_user_config_dir/lib/nord-dircolors/src/dir_colors; and eval (dircolors -c $__fish_user_config_dir/lib/nord-dircolors/src/dir_colors)

    # bat(1) customizations.
    # See: https://github.com/sharkdp/bat#customization
    if type -q bat
        set -Ux BAT_CONFIG_PATH $XDG_CONFIG_HOME/bat/bat.conf

        # Also set bat as the pager for forgit.
        # See: https://github.com/wfxr/forgit#--options
        set -Ux FORGIT_PAGER bat
        set -Ux FORGIT_IGNORE_PAGER 'bat -l gitignore'
    end

    # enhancd configurations.
    # See: https://github.com/b4b4r07/enhancd#configurations
    if type -q enhancd
        # The number of directories that enhancd will recurse into.
        set -Ux ENHANCD_HYPHEN_NUM 16

        # Completions to be generated.
        set -Ux ENHANCD_COMPLETION_BEHAVIOR list,history

        # Set's enhancd filter to fzf if available.
        type -q fzf; and set -Ux ENHANCD_FILTER fzf
    end

    # fzf environment variables.
    # See: https://github.com/jethrokuan/fzf#variables
    if type -q fzf
        # Use fzf in fullscreen mode with command line at the bottom, allow to cycle through results when moving out
        # of range at the bottom or start and always use 2 spaces for tab stops.
        set -Ux FZF_DEFAULT_OPTS --no-height --no-reverse --cycle --tabstop=2

        # Adjust the colors to match the "Nord" theme.
        # See: https://www.nordtheme.com
        set FZF_DEFAULT_OPTS $FZF_DEFAULT_OPTS --color bg:'#2E3440',bg+:'#4C566A',fg:'#E5E9F0'
        set FZF_DEFAULT_OPTS $FZF_DEFAULT_OPTS --color fg+:'#ECEFF4',hl:'#88C0D0',hl+:'#81A1C1'
        set FZF_DEFAULT_OPTS $FZF_DEFAULT_OPTS --color preview-bg:'#2E3440',preview-fg:'#E5E9F0'
        set FZF_DEFAULT_OPTS $FZF_DEFAULT_OPTS --color border:'#4C566A',gutter:'#3B4252',header:'#88C0D0'
        set FZF_DEFAULT_OPTS $FZF_DEFAULT_OPTS --color info:'#88C0D0',marker:'#88C0D0',pointer:'#81A1C1'
        set FZF_DEFAULT_OPTS $FZF_DEFAULT_OPTS --color prompt:'#88C0D0',spinner:'#88C0D0'

        # Exports the default fzf options.
        set -Ux FZF_DEFAULT_OPTS $FZF_DEFAULT_OPTS

        # Options to fzf completions.
        set -Ux FZF_COMPLETION_OPTS '+c -x'
    end

    # Makes fzf use fd to find files and directories by default.
    if type -q fd
        set -Ux FZF_DEFAULT_COMMAND 'fd --type f --hidden --follow --exclude .git'

        # Also sets the default command to the ^T key binding.
        set -Ux FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND
    end
end
