{ pkgs }:
pkgs.writeShellScriptBin "starter_apps" ''  
  toggle-monitor &
  qbittorrent &
  discord &
  sleep 4 ;
  hyprctl dispatch workspace 1 ;
  music-space &
''
