{ pkgs }:
pkgs.writeShellScriptBin "starter_apps" ''  
  music-space ;
  obsidian &
  qbittorrent &
  vesktop &
  management-space;
''
