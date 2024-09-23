<div align="center">

## MmedOs 🟰 Best NixOs config (for me personnally)

Mmed is my personal reproducible configuration on any NixOS system. This includes scripts, applications, config files, and more.

**Inspiration for the file structure [here](https://gitlab.com/Zaney/zaneyos).**

</div>

#### 🍖 Requirements

- You must be running on NixOS.
- The MmedOs folder (this repo) is expected to be in your home directory.
- Must have installed using GPT & UEFI. Systemd-boot is what is supported, for GRUB you will have to brave the internet for a how-to. ☺️

#### 🖥️ Multi Host & User Configuration

- You can now define separate settings for different host machines and users!
- Easily specify extra packages for your users in the users.nix file.
- Easy to understand file structure and simple, but encompassing, configuratiion.

<div align="center">

</div>

#### 🙋 Having Issues / Questions?

- Please feel free to raise an issue on the repo, please label a feature request with the title beginning with [feature request], thank you!
- Contact me on [Discord]() as well, for a potentially faster response.

### ⬇️ Install

#### 🦽 Manual:

Run this command to ensure Git & Vim are installed:

```
nix-shell -p git vim
```

Clone this repo & enter it:

<!--todo-->

```
git clone
cd mmedOs
```

- _You should stay in this folder for the rest of the install_

Create the host folder for your machine(s)

```
cp -r hosts/default hosts/<your-desired-hostname>
```

**🪧🪧🪧 Edit options.nix 🪧🪧🪧**

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
