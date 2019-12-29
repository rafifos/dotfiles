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

Download the lastest version from [FooSoft Productions](https://foosoft.net/projects/homemaker/dl/homemaker_darwin_amd64.tar.gz) and place `homemaker` in this repository root.

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
gem update --system
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
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

### Bundle `Brewfile`

```sh
brew bundle --verbose
```

### Install Ruby on Rails

Folow the instructions on [Install Rails](http://installrails.com).

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
DavidAnson.vscode-markdownlint
EditorConfig.EditorConfig
Gaardsholt.vscode-whatthecommit
IBM.output-colorizer
Orta.vscode-jest
PKief.material-icon-theme
VisualStudioExptTeam.vscodeintellicode
aaron-bond.better-comments
arcticicestudio.nord-visual-studio-code
bierner.github-markdown-preview
bierner.markdown-checkbox
bierner.markdown-emoji
bierner.markdown-preview-github-styles
bierner.markdown-yaml-preamble
bungcip.better-toml
dbaeumer.vscode-eslint
eamodio.gitlens
esbenp.prettier-vscode
mgmcdermott.vscode-language-babel
mikestead.dotenv
ms-azuretools.vscode-docker
ms-vscode.js-debug-nightly
ms-vscode.vscode-typescript-tslint-plugin
msjsdiag.vscode-react-native
naumovs.color-highlight
rebornix.ruby
tombonnike.vscode-status-bar-format-toggle
wingrunr21.vscode-ruby
wix.glean
EOF
```
