{ pkgs, ... }:
{
  home.packages = (with pkgs; [
    nsxiv
    flavours
    swww
    neofetch
    xorg.xrdb
    (import ../scripts/ghosts.nix { inherit pkgs; })
    (import ../scripts/squirtle.nix { inherit pkgs; })
    (import ../scripts/wall-select.nix { inherit pkgs; })
    (import ../scripts/theme-select.nix { inherit pkgs; })
    (import ../scripts/theme-save.nix { inherit pkgs; })
  ]);
}


