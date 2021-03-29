# First boot, install and setup plugins.
if not type -q fisher; and status is-interactive
    curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher

    fisher install b4b4r07/enhancd
    fisher install gazorby/fish-abbreviation-tips
    fisher install jorgebucaran/autopair.fish
    fisher install jorgebucaran/replay.fish
    fisher install wfxr/forgit
end
