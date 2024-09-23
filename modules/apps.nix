{ pkgs, pkgs-unstable, ... }:
{
  home.packages = (with pkgs; [
    stremio
    obsidian
    rofimoji # emoji picker
    dolphin # gui file manager
    wtype # wayland typing indicator
    btop # better htop
    unclutter
    mpvpaper
    zathura
    tree
  ])
  ++
  (with pkgs-unstable; [
    nh
    nix-output-monitor
    nvd
    nix-index
    ags
    yazi
  ]);
}
