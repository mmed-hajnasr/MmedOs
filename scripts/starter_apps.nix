{ pkgs }:
pkgs.writeShellScriptBin "starter_apps" ''  
  qbittorrent &
  vesktop &
  sleep 4 ;
  hyprctl dispatch workspace 1 ;
  music-space &
''
