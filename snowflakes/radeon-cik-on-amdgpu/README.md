# Enabling AMDGPU on Sea Islands (CIK) GPUs

## Set module parameters in modprobe.d

The following method is confirmed working on a Radeon R7 360 using elementary OS Juno (Ubuntu 18.04 and other derivates should work fine).

```sh
# echo "options amdgpu cik_support=1" > /etc/modprobe.d/amdgpu.conf
```

```sh
# echo "options radeon cik_support=0" > /etc/modprobe.d/radeon.conf
```

**NOTE:** Make sure modconf is in the the HOOKS array in /etc/mkinitcpio.conf and regenerate the initramfs using:

```sh
# update-initramfs -u -v
```

## Sources

- [AMDGPU - ArchWiki](https://wiki.archlinux.org/index.php/AMDGPU#Enable_Southern_Islands_(SI)_and_Sea_Islands_(CIK)_support)