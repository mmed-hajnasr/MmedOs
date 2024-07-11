{ pkgs }:
pkgs.writeShellScriptBin "toggle-monitor" ''  
  if [ $(hyprctl monitors | grep ID | wc -l) -eq 2 ]; then
    hyprctl keyword monitor eDP-1,disable
  elif
    [ $(hyprctl monitors | grep ID | wc -l) -eq 1 ]; then
    hyprctl keyword monitor eDP-1,1920x1080@120, 1920x0, 1
  fi
''
