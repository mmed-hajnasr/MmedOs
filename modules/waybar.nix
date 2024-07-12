{ pkgs, ... }:
{
  home.packages = with pkgs; [
    pavucontrol # Pulseaudio volume control
    playerctl
    waybar
  ];
}
