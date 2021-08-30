# asdf-vm setup.
# See: https://asdf-vm.com/#/core-manage-asdf?id=install
if not test -d ~/.asdf
    git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.8.0

    not test -d ~/.config/fish/completions; and mkdir -p ~/.config/fish/completions
    ln -sf ~/.asdf/completions/asdf.fish ~/.config/fish/completions

    source ~/.asdf/asdf.fish

    asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git

    # Post-install tasks.
    replay 'bash -c \'${ASDF_DATA_DIR:=$HOME/.asdf}/plugins/nodejs/bin/import-release-team-keyring\''

    asdf install nodejs lts-fermium
    asdf global nodejs lts-fermium
else
    source ~/.asdf/asdf.fish
end
