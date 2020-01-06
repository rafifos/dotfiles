# rafifos does dotfiles, managed by Homemaker

## TODO

- ~~Migrate `zsh` to [Oh MY Zsh](https://github.com/robbyrussell/oh-my-zsh)~~ Migrated to [ZIM](https://github.com/zimfw/zimfw)

## Important notes

This dotfiles's `zsh` configuration includes a specific [file](zsh/ztoken) for storing your tokens. **DO NOT** commit anything to this file.

The file is tracked by `git`, and you probably don't want it to be. To disable tracking on this file, run:

```sh
git update-index --skip-worktree zsh/ztoken
```

## Download `homemaker`

Download the lastest version from [FooSoft Productions](https://foosoft.net/projects/homemaker/#installation) and place `homemaker` in this repository root.

## Deploying

Prerequisites:

- Your `ssh` key to be already in the keyring

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

### Install `node` and `yarn`

```sh
export NVM_DIR="$HOME/.nvm"
[[ ! -d "$NVM_DIR" ]] && mkdir "$NVM_DIR"
source "$(brew --prefix)/opt/nvm/nvm.sh"
source "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm"
nvm install --lts
npm install --global yarn
```

### Install Ruby and Ruby on Rails

For many reasons, it's recommended to use [`rvm`](https://rvm.io), you can follow the tutorial on [Install Rails](https://installrails.com) for more information.

### Deploy

```sh
./homemaker -clobber -verbose -variant=`variant` config.toml "$PWD"
```

> NOTE: Variant can be `linux` and `darwin` atm.

## Bugs and Workarounds

### Visual Studio Code

#### Extensions

You will need to install the extensions manually while I figure out a way of automating it's install procedure for this project.

```sh
cat <<EOF | xargs -L 1 code --install-extension
aaron-bond.better-comments
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
EditorConfig.EditorConfig
esbenp.prettier-vscode
Gaardsholt.vscode-whatthecommit
IBM.output-colorizer
icrawl.discord-vscode
merithayan.polar
mgmcdermott.vscode-language-babel
mikestead.dotenv
ms-azuretools.vscode-docker
ms-vscode-remote.remote-wsl
ms-vscode.js-debug-nightly
ms-vscode.vscode-typescript-tslint-plugin
msjsdiag.vscode-react-native
naumovs.color-highlight
Orta.vscode-jest
PKief.material-icon-theme
pnp.polacode
rebornix.ruby
richie5um2.vscode-sort-json
rocketseat.RocketseatReactJS
rocketseat.RocketseatReactNative
tombonnike.vscode-status-bar-format-toggle
VisualStudioExptTeam.vscodeintellicode
wingrunr21.vscode-ruby
wix.glean
EOF
```
