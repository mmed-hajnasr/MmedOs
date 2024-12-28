{ pkgs, ... }:
{
  home.packages = with pkgs; [
    swappy # image viewer
    wl-clipboard # Clipboard manager
    (import ../scripts/screenshot.nix { inherit pkgs; })
    (import ../scripts/starter_apps.nix { inherit pkgs; })
    (import ../scripts/start.nix { inherit pkgs; })
  ];
}
