{ pkgs }:
pkgs.writeShellScriptBin "toggle-monitor" ''  
  if [ $(hyprctl monitors | grep ID | wc -l) -eq 2 ]; then
    hyprctl keyword monitor eDP-1,disable
    hyprctl dispatch dpms off eDP-1
  elif
    [ $(hyprctl monitors | grep ID | wc -l) -eq 1 ]; then
    hyprctl dispatch dpms on eDP-1
  fi
''
