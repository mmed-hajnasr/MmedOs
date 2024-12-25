{ pkgs, ... }:
{
  home.packages = ([
    (import ../scripts/go-browser.nix { inherit pkgs; })
    (import ../scripts/music-space.nix { inherit pkgs; })
    (pkgs.writeShellScriptBin "make-main" ''  
      hyprctl dispatch movewindow l;
      hyprctl dispatch movewindow u;
      hyprctl dispatch resizeactive exact 70% 70%;
    '')
  ]);
  # ++
  # (with pkgs-unstable; [
  # ]);

}

