function _bind_dollar --description 'See: https://github.com/fish-shell/fish-shell/wiki/Bash-Style-Command-Substitution-and-Chaining-(!!-!$)'
    switch (commandline -t)
        # Variation on the original, vanilla "!" case
        # ===========================================
        #
        # If the `!$` is preceded by text, search backward for tokens that
        # contain that text as a substring. E.g., if we'd previously run
        #
        #   git checkout -b a_feature_branch
        #   git checkout main
        #
        # then the `fea!$` in the following would be replaced with
        # `a_feature_branch`
        #
        #   git branch -d fea!$
        #
        # and our command line would look like
        #
        #   git branch -d a_feature_branch
        #
        case "*!"
            commandline -f backward-delete-char history-token-search-backward
        case "*"
            commandline -i '$'
    end
end
