{ pkgs }:
pkgs.writeShellScriptBin "toggle-monitor" ''  
  if [ $(hyprctl monitors | grep ID | wc -l) -eq 2 ]; then
    sd 'eDP-1, 1920x1080@120,1920x60,1' 'eDP-1, disable' ~/.config/hypr/hyprland.conf
  elif [ $(hyprctl monitors | grep ID | wc -l) -eq 1 ]; then
    sd 'eDP-1, disable' 'eDP-1, 1920x1080@120,1920x60,1' ~/.config/hypr/hyprland.conf
  fi
''
