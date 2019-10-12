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
