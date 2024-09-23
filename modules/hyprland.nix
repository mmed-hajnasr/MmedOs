{ pkgs, ... }:
{
  home.packages = with pkgs; [
    swappy # image viewer
    wl-clipboard # Clipboard manager
    (import ../scripts/screenshot.nix { inherit pkgs; })
    (import ../scripts/starter_apps.nix { inherit pkgs; })
    (import ../scripts/toggle-monitor.nix { inherit pkgs; })
    (import ../scripts/monitor-on.nix { inherit pkgs; })
  ];
}
