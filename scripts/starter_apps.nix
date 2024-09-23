{ pkgs }:
pkgs.writeShellScriptBin "starter_apps" ''  
  qbittorrent &
  vesktop &
  sleep 3;
  hyprctl dispatch workspace 10 ;
  management-space ;
  sleep 1;
  hyprctl dispatch workspace 1 ;
  music-space ;
''
