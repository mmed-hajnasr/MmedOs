{ pkgs, pkgs-unstable, inputs, ... }:
let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
in
{
  imports = [ inputs.spicetify-nix.homeManagerModules.default ];

  programs.spicetify =
    {
      enable = true;
      enabledExtensions = with spicePkgs.extensions; [
        keyboardShortcut
        adblock
        playNext
        trashbin
      ];
    };

  home.packages = (with pkgs; [
    cava
    cmatrix
    syncthing
    (import ../scripts/mute_ads_spotify.nix { inherit pkgs; })
    (pkgs.writeShellScriptBin "update_music" ''
      current_dir=$(pwd)
      cd ~/Music
      spotdl "https://open.spotify.com/playlist/0RcaDLYa2JzIcBwv2XFqQW?si=05a86b07cd4a4158"
      cd $current_dir
    '')
  ]) ++ (with pkgs-unstable;[
    spotube
    spotdl
  ]);
}
