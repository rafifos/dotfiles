# asdf-vm setup.
# See: https://asdf-vm.com/#/core-manage-asdf?id=install
if not test -d ~/.asdf
    git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.11.1

    not test -d ~/.config/fish/completions; and mkdir -p ~/.config/fish/completions
    ln -sf ~/.asdf/completions/asdf.fish ~/.config/fish/completions

    source ~/.asdf/asdf.fish

    asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git

    asdf install nodejs lts
    asdf install nodejs lts-hydrogen

    asdf global nodejs lts
else
    source ~/.asdf/asdf.fish
end
