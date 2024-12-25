{ pkgs }:
pkgs.writeShellScriptBin "music-space" ''  
  hyprctl dispatch workspace 1 ;
  sleep 0.5;
  hyprctl dispatch killactive ;
  hyprctl dispatch killactive ;
  hyprctl dispatch killactive ;
  spotify &
  kitty cava &
  kitty cmatrix &
  sleep 1;
  hyprctl dispatch focuswindow class:Spotify;
  hyprctl dispatch movewindow l;
  hyprctl dispatch movewindow u;
  hyprctl dispatch resizeactive exact 80% 70%;
  playerctl play;
''
