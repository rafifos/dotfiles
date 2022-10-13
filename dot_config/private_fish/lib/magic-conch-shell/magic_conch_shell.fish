function magic_conch_shell --description "Prints a random quote from the Magic Conch shell."
    # Source: https://spongebob.fandom.com/wiki/Magic_Conch_shell#Answers
    set -l __magic_conch_answers '"Maybe someday."'
    set -a __magic_conch_answers '"Nothing."'
    set -a __magic_conch_answers '"Neither."'
    set -a __magic_conch_answers '"I don\'t think so."'
    set -a __magic_conch_answers '"No."'
    set -a __magic_conch_answers '"Yes."'
    set -a __magic_conch_answers '"Try asking again."'

    set -l __magic_conch_answer (random choice $__magic_conch_answers)

    echo Here\'s what the (set_color -i B48EAD)"Magic Conch shell"(set_color normal) has to say:
    echo "> $__magic_conch_answer"
end
