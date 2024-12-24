{ pkgs, ... }:
{
  home.packages = ([
    (pkgs.writeShellScriptBin "make-main" ''
      hyprctl dispatch movewindow l;
      hyprctl dispatch movewindow u;
      hyprctl dispatch resizeactive exact 70% 70%;
    '')
    (pkgs.writeShellScriptBin "go-browser" ''
    '')
  ]);
  # ++
  # (with pkgs-unstable; [
  # ]);

}

