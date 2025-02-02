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
    (import ../scripts/update_music.nix { inherit pkgs; })
  ]) ++ (with pkgs-unstable;[
    spotube
    spotdl
  ]);
}
