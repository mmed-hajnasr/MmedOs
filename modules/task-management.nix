{ pkgs, ... }:
{
  home.packages = (with pkgs; [
    tomato-c
    (pkgs.writeShellScriptBin "management-space" ''
      hyprctl dispatch workspace 10 ;
      kitty tomato&
      hyprctl dispatch workspace 10 ;
      kitty do-me&
    '')
  ]);
  # ++
  # (with pkgs-unstable; [
  # ]);
}
