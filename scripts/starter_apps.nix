{ pkgs }:
pkgs.writeShellScriptBin "starter_apps" ''  
  obisdian &
  qbittorrent &
  vesktop &
  mute-ads &
  hyprctl dispatch workspace 1 ;
  music-space ;
''
