# Installs fundle if it isn't installed.
if status is-interactive; and not functions -q fundle
    eval (curl -sfL https://git.io/fundle-install)
end

# Plugins used in this environment
fundle plugin tuvistavie/oh-my-fish-core
fundle plugin "jorgebucaran/autopair.fish"
fundle plugin "jorgebucaran/replay.fish"
fundle plugin "kidonng/vscode.fish"
fundle plugin b4b4r07/enhancd
fundle plugin franciscolourenco/done
fundle plugin gazorby/fish-abbreviation-tips
fundle plugin joseluisq/gitnow
fundle plugin meaningful-ooo/sponge
fundle plugin nickeb96/puffer-fish
fundle plugin oh-my-fish/plugin-grc
fundle plugin wfxr/forgit

# Initialize fundle, loading all the available plugins.
fundle init
