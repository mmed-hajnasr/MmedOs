{ pkgs }:
pkgs.writeShellScriptBin "starter_apps" ''  
  obsidian &
  qbittorrent &
  vesktop &
  management-space;
  sleep 1;
  music-space ;
''
