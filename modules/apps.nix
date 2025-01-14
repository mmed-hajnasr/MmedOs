{ pkgs, pkgs-unstable, ... }:
{

  home.packages = (with pkgs; [
    stremio
    rofimoji # emoji picker
    dolphin # gui file manager
    wtype # wayland typing indicator
    btop # better htop
    unclutter
    mpvpaper
    zathura
    yazi
    tree
    hyprpanel
    playerctl
  ])
  ++
  (with pkgs-unstable; [
    nh
    nix-output-monitor
    nvd
    nix-index
    obsidian
  ]);
}
