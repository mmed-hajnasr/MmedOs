{ pkgs }:
pkgs.writeShellScriptBin "monitor-on" ''  
    sd 'eDP-1, disable' 'eDP-1, 1920x1080@120, 0x0, 1' ~/.config/hypr/hyprland.conf
''
