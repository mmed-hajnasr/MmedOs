<div align="center">

## MmedOs

MmedOs is my personal reproducible configuration for my NixOS system. This includes scripts, config files and more.
this system is charactarized by a dynamic theme using base16 color scheme.

**Inspiration for the file structure [here](https://gitlab.com/Zaney/zaneyos).**

</div>

#### 🍖 Requirements

- You must be running on NixOS.
- The MmedOs folder (this repo) is expected to be in your home directory.
- Must have installed using GPT & UEFI. Systemd-boot is what is supported, for GRUB you will have to brave the internet for a how-to. ☺️

<div align="center">

</div>

### ⬇️ Install

#### 🦽 Manual:

Run this command to ensure Git & Vim are installed:

```
nix-shell -p git vim
```

Clone this repo & enter it:

<!--todo-->

```
git clone git@github.com:mmed-hajnasr/MmedOs.git
cd MmedOs
```

- _You should stay in this folder for the rest of the install_

Create the host folder for your machine(s)

```
cp -r hosts/default hosts/<your-desired-hostname>
```

**🪧🪧🪧 Edit config.nix 🪧🪧🪧**

Generate your hardware.nix like so:

```
nixos-generate-config --show-hardware-config > hosts/<your-desired-hostname>/hardware.nix
```

Run this to enable flakes and install the flake replacing hostname with whatever you put as the hostname:

```
NIX_CONFIG="experimental-features = nix-command flakes"
sudo nixos-rebuild switch --flake .#hostname
```

Now when you want to rebuild the configuration you have access to an alias called flake-rebuild that will rebuild the flake!

Hope you enjoy!
