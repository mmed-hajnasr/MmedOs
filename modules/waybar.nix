{ pkgs, ... }:
{
  home.packages = with pkgs; [
    waybar # Status bar
    pavucontrol # Pulseaudio volume control
  ];
}
