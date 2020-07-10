# rafifos does dotfiles, managed by Homemaker

## TODO

- ~~Migrate `zsh` to [Oh MY Zsh](https://github.com/robbyrussell/oh-my-zsh)~~ Migrated to [ZIM](https://github.com/zimfw/zimfw)
- Migrate `homemaker` to [`dotbot`](https://github.com/anishathalye/dotbot)

## Important notes

This dotfiles's `zsh` configuration includes a specific [file](zsh/zprivate) for storing your private configurations. **DO NOT** commit anything to this file.

The file is tracked by `git`, and you probably don't want it to be. To disable tracking on this file, run:

```sh
git update-index --skip-worktree zsh/zprivate
```

## Usage

```sh
./bootstrap
```
