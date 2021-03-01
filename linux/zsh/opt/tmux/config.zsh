  if [[ -z $TMUX ]]; then
    # Workaround for handling TERM variable in multiple tmux sessions properly.
    # @see: http://sourceforge.net/p/tmux/mailman/message/32751663
    case $(tmux showenv TERM 2>/dev/null) in
      *256color) ;&
      TERM=fbterm)
        TERM=screen-256color ;;
      *)
        TERM=screen
    esac

    # When Zsh is started attach to the current tmux session or create a new one.
    tmux attach -t TMUX || tmux new -s TMUX
  fi
