# APT

> [APT][] - Advanced Packaging Tool

## Usage

### Installing from an `Aptfile`

Currently, `apt` itself doesn't provide a proper way to install packages from a file, technically you could put the package names to a file and `cat packages.txt | xargs sudo apt install` but this approach has several limitations (like custom repositories).

[bash-aptfile][] provides a simple method of defining apt-get dependencies for an application (or project, in this case).

```shell-session
sudo ./bash-aptfile/bin/aptfile Aptfile
```

[apt]: https://wiki.debian.org/Apt
[bash-aptfile]: https://github.com/seatgeek/bash-aptfile
