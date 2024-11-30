{ pkgs ? import <nixpkgs> { } }:
pkgs.writeShellScriptBin "music-space" ''  
  spotify &
  hyprctl dispatch workspace 1 ;
  kitty cava &
  kitty cmatrix &
  sleep 1;
  hyprctl dispatch focuswindow class:Spotify;
  hyprctl dispatch movewindow l;
  hyprctl dispatch movewindow u;
  hyprctl dispatch resizeactive exact 80% 70%;
  sleep 5;
  id=$(${pkgs.pulseaudio}/bin/pactl list sink-inputs | grep -B 20 "application.name = \"spotify\"" | grep "Sink Input" | awk '{print $3}' | tr -d '#')
  ${pkgs.pulseaudio}/bin/pactl set-sink-input-mute "$id" 0
''
