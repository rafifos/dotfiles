# Installs fisher if it isn't installed.
if status is-interactive && ! functions -q fisher
    curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher update
end
