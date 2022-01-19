# Installs fisher if it isn't installed.
if status is-interactive && ! functions -q fisher
    curl -sL https://git.io/fisher | source && fisher update
end
