{ pkgs }:
pkgs.writeShellScriptBin "starter_apps" ''  
  music-space ;
  obisdian &
  qbittorrent &
  vesktop &
  mute-ads &
  management-space;
''
