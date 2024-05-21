# Installs fundle if it isn't installed.
if status is-interactive; and not functions -q fundle
    eval (curl -sfL https://git.io/fundle-install)
end

# Plugins used in this environment
fundle plugin "jorgebucaran/autopair.fish"
fundle plugin catppuccin/fish
fundle plugin franciscolourenco/done
fundle plugin gazorby/fish-abbreviation-tips
fundle plugin meaningful-ooo/sponge
fundle plugin pure-fish/pure

# Initialize fundle, loading all the available plugins.
fundle init
