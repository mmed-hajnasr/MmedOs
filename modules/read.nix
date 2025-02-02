{ pkgs, ... }:
{
  home.packages = (with pkgs; [
    calibre
    jq
    fzf
    gum
  ]);
  # ++
  # (with pkgs-unstable; [
  # ]);

}
