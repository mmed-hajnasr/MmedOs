{ inputs, pkgs, pkgs-unstable, system, ... }:
{
  imports = [
    inputs.zen-browser.homeModules.beta
    # inputs.zen-browser.homeModules.twilight
    # inputs.zen-browser.homeModules.twilight-official
  ];

  programs.zen-browser = {
    enable = true;
    policies = {
      DisableAppUpdate = true;
      DisableTelemetry = true;
      # find more options here: https://mozilla.github.io/policy-templates/
    };
  };

  home.packages = (with pkgs; [
    zathura
    stremio
    rofimoji # emoji picker
    kdePackages.dolphin
    wtype # wayland typing indicator
    btop # better htop
    unclutter
    mpvpaper
    yazi
    tree
    hyprpanel
    playerctl
  ])
  ++
  (with pkgs-unstable; [
    windsurf
    nh
    nix-output-monitor
    nvd
    nix-index
    obsidian
  ]);
}
