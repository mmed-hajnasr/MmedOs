{ pkgs, ... }:
{
  home.packages = (with pkgs; [
    drawing
    gimp
    inkscape
    kooha
  ]);
  # ++
  # (with pkgs-unstable; [
  # ]);
}
