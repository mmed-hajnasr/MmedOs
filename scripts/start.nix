{ pkgs }:
pkgs.writeShellScriptBin "start" ''  
  monitor &&
  sleep 1;
  Hyprland
''
