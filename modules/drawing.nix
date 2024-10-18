{ pkgs, ... }:
{
  home.packages = (with pkgs; [
    gimp
    obs-studio
    obs-cli
    mpv
  ]);
  # ++
  # (with pkgs-unstable; [
  # ]);
}
