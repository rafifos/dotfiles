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

### Install Xcode Command Line Tools

```sh
xcode-select --install
```

### Install Homebrew

```sh
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

### Bundle `Brewfile`

```sh
brew bundle
```

### `ssh`

#### Create `$HOME/.ssh`

```sh
mkdir -m 744 "$HOME/.ssh"
```

#### Start `ssh-agent`

```sh
eval "$(ssh-agent -s)"
```

### Deploy

```sh
./homemaker -clobber -verbose config.toml "$PWD"
```

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
VisualStudioExptTeam.vscodeintellicode
bierner.github-markdown-preview
bierner.markdown-checkbox
bierner.markdown-emoji
bierner.markdown-preview-github-styles
bierner.markdown-yaml-preamble
bungcip.better-toml
christian-kohler.npm-intellisense
christian-kohler.path-intellisense
dbaeumer.vscode-eslint
eamodio.gitlens
esbenp.prettier-vscode
mikestead.dotenv
monokai.theme-monokai-pro-vscode
ms-vscode.vscode-typescript-tslint-plugin
msjsdiag.debugger-for-chrome
msjsdiag.vscode-react-native
naumovs.color-highlight
rocketseat.RocketseatReactNative
wayou.vscode-todo-highlight
ymotongpoo.licenser
EOF
```

### League of Legends

#### Voice chat not working

See [this post on Reddit.](https://www.reddit.com/r/leagueoflegends/comments/ay9o4s/how_to_fix_voice_chat_in_macos_mojave/)
