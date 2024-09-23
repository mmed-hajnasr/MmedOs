{ pkgs, inputs, ... }:
let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
in
{
  imports = [ inputs.spicetify-nix.homeManagerModules.default ];

  programs.spicetify =
    {
      enable = true;
      theme = spicePkgs.themes.starryNight;
      enabledExtensions = with spicePkgs.extensions; [
        keyboardShortcut
        adblock
        playNext
        trashbin
      ];
    };

  home.packages = with pkgs; [
    cava
    cmatrix
    syncthing
    (pkgs.writeShellScriptBin "music-space" ''
      hyprctl dispatch workspace 1 ;
      spotify --disable-gpu &
      hyprctl dispatch workspace 1 ;
      kitty cava &
      kitty cmatrix &
    '')
    (pkgs.writeShellScriptBin "update_music" ''
      current_dir=$(pwd)
      cd ~/Music
      spotdl "https://open.spotify.com/playlist/1IFByXt9QiKJvIEZHQ1LmT?si=9955d6a3e7924ce2"
      spotdl "https://open.spotify.com/playlist/0RcaDLYa2JzIcBwv2XFqQW?si=05a86b07cd4a4158"
      cd $current_dir
    '')
  ];
}
