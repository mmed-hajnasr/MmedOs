{ pkgs }:
pkgs.writeShellScriptBin "music-space" ''  
  hyprctl dispatch workspace 1 ;
  sleep 0.5;
  hyprctl dispatch killactive ;
  hyprctl dispatch killactive ;
  hyprctl dispatch killactive ;
  sleep 0.5;
  spotify &
  kitty cmatrix &
  kitty cava &
  hyprctl dispatch focuswindow class:Spotify;
  sleep 1;
  hyprctl dispatch movewindow l;
  hyprctl dispatch movewindow u;
  hyprctl dispatch resizeactive exact 80% 70%;
''
