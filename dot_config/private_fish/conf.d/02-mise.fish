# mise-en-place setup.
# See: https://mise.jdx.dev/getting-started.html
if not type -q node
    mise install

    if status is-interactive
        mise activate fish | source
    else
        mise activate fish --shims | source
    end
end
