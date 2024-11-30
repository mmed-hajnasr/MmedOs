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
    (import ../scripts/music-space.nix { inherit pkgs; })
    (pkgs.writeShellScriptBin "unmute" ''
      id=$(${pkgs.pulseaudio}/bin/pactl list sink-inputs | grep -B 20 "application.name = \"spotify\"" | grep "Sink Input" | awk '{print $3}' | tr -d '#')
      ${pkgs.pulseaudio}/bin/pactl set-sink-input-mute "$id" 0
    '')
    (pkgs.writeShellScriptBin "music-space-offline" ''
      hyprctl dispatch workspace 1 ;
      spotube &
      hyprctl dispatch workspace 1 ;
      kitty cava &
      kitty cmatrix &
    '')
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
