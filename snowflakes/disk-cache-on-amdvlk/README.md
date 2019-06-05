# Enabling Cache to Disk on AMDVLK

## Settings file

Create a file named `amdPalSettings.cfg` in any of the following paths:

- /etc/amd
- $XDG_CONFIG_HOME
- $HOME/.config

Add a line containing the following: `ShaderCacheMode,2` to the settings file you've created. This will enable shader cache to disk on AMDVLK.

Example:

```sh
$ echo 'ShaderCacheMode,2' >> $HOME/.config/amdPalSettings.cfg
```

## Sources

- [README in the AMDVLK Repository @ GitHub](https://github.com/GPUOpen-Drivers/AMDVLK#runtime-settings)