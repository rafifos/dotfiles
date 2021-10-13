# First boot, install and setup plugins.
if status is-interactive; and not type -q fisher
    curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher

    fisher install b4b4r07/enhancd
    fisher install gazorby/fish-abbreviation-tips
    fisher install jorgebucaran/autopair.fish
    fisher install jorgebucaran/replay.fish
    fisher install oh-my-fish/plugin-grc
    fisher install wfxr/forgit
end
