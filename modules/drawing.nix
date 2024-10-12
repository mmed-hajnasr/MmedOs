{ pkgs, ... }:
{
  home.packages = (with pkgs; [
    gimp
    kooha
  ]);
  # ++
  # (with pkgs-unstable; [
  # ]);
}
