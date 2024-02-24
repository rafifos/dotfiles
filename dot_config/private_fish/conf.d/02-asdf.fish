# asdf-vm setup.
# See: https://asdf-vm.com/#/core-manage-asdf?id=install
if not test -d ~/.asdf
    git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0

    not test -d ~/.config/fish/completions; and mkdir -p ~/.config/fish/completions
    ln -sf ~/.asdf/completions/asdf.fish ~/.config/fish/completions

    source ~/.asdf/asdf.fish

    asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git

    # https://github.com/asdf-vm/asdf-nodejs/issues/352#issuecomment-1569477783
    asdf install nodejs (asdf nodejs resolve lts --latest-available)
    asdf global nodejs (asdf nodejs resolve lts --latest-available)
else
    source ~/.asdf/asdf.fish
end
