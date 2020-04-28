# rafifos does dotfiles, managed by Homemaker

## TODO

- ~~Migrate `zsh` to [Oh MY Zsh](https://github.com/robbyrussell/oh-my-zsh)~~ Migrated to [ZIM](https://github.com/zimfw/zimfw)

## Important notes

This dotfiles's `zsh` configuration includes a specific [file](zsh/zprivate) for storing your private configurations. **DO NOT** commit anything to this file.

The file is tracked by `git`, and you probably don't want it to be. To disable tracking on this file, run:

```sh
git update-index --skip-worktree zsh/zprivate
```

## Download `homemaker`

Download the lastest version from [FooSoft Productions](https://foosoft.net/projects/homemaker/#installation) and place `homemaker` in this repository root.

## Deploying

Prerequisites:

- Your `ssh` key to be already in the keyring
- `zsh` to be your default _shell_.

### Linux (and WSL)

This section assumes you're using Ubuntu, or any other `apt`-based distro.

#### Install prerequisites

```sh
sudo apt install build-essential curl file git zsh
```

#### Install Linuxbrew

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
```

### macOS

#### Install Xcode Command Line Tools

```sh
xcode-select --install
```

#### Install Homebrew

```sh
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

### Bundle `Brewfile`

```sh
brew bundle --verbose
```

### Windows

#### Install Boxstarter Modules

```powershell
iex ((New-Object System.Net.WebClient).DownloadString('https://boxstarter.org/bootstrapper.ps1')); Get-Boxstarter -Force
```

#### Install the Boxstarter Package

```powershell
Install-BoxstarterPackage -PackageName ./Set-WindowsEnvironmentSettings.ps1 -DisableReboots
```

> NOTE: This requires you to be in a elevated PowerShell prompt.

### Deploy

```sh
env OS=$OS ./homemaker -clobber -verbose -variant=<variant> config.toml "$PWD"
```

> NOTE: Variant can be either `linux` or `darwin`.

### Install Node.js

```sh
# Injects asdf-vm into the current shell session.
source "$(brew --prefix asdf)/asdf.sh"

# Adds the Node.js plugin for asdf.
asdf plugin add nodejs

# Import the Node.js release team's OpenPGP keys to main keyring.
bash "$HOME/.asdf/plugins/nodejs/bin/import-release-team-keyring"
```

## Visual Studio Code

This dotfiles include advanced support for:

- JavaScript
- TypeScript
- React

### Extensions

You will need to install the extensions manually while I figure out a way of automating it's install procedure for this project.

```sh
cat <<EOF | xargs -L 1 code --install-extension
arcticicestudio.nord-visual-studio-code
bierner.github-markdown-preview
bierner.markdown-checkbox
bierner.markdown-emoji
bierner.markdown-preview-github-styles
bierner.markdown-yaml-preamble
bungcip.better-toml
DavidAnson.vscode-markdownlint
dbaeumer.vscode-eslint
eamodio.gitlens
esbenp.prettier-vscode
icrawl.discord-vscode
mikestead.dotenv
ms-vscode-remote.remote-wsl
nicoespeon.abracadabra
nicoespeon.hocus-pocus
Orta.vscode-jest
PKief.material-icon-theme
pmneo.tsimporter
richie5um2.vscode-sort-json
rocketseat.RocketseatReactJS
timonwong.shellcheck
tombonnike.vscode-status-bar-format-toggle
VisualStudioExptTeam.vscodeintellicode
wix.glean
EOF
```
