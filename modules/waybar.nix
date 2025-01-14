{ pkgs, ... }:
{
  home.packages = with pkgs; [
    pavucontrol # Pulseaudio volume control
    waybar
    (import ../scripts/bar-init.nix { inherit pkgs; })
  ];
}
