# Flatpak

> [Flatpak][] — the future of application distribution

## Usage

### Install from an `.flatpakref` file

.flatpakref files can be used in combination with repositories to provide an additional, easy way for users to [install][] an application, often by clicking on the file or a download link.

```shell-session
find . -maxdepth 1 -type f -name '*.flatpakref' -exec flatpak install --user "{}"
```

[flatpak]: https://flatpak.org
[install]: https://docs.flatpak.org/en/latest/repositories.html#flatpakref-files
