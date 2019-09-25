# rafifos does dotfiles, managed by Homemaker

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
./homemaker -clobber config.toml "$PWD"
```
