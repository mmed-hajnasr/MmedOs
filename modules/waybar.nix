{ pkgs, ... }:
{
  home.packages = with pkgs; [
    swaynotificationcenter
    pavucontrol # Pulseaudio volume control
    playerctl
    waybar
    (import ../scripts/bar-init.nix { inherit pkgs; })
  ];
}
