{ pkgs }:
pkgs.writeShellScriptBin "cycle" ''  
if [[ $(hyprctl activewindow | grep grouped | grep -o ',') ]]; then
  hyprctl dispatch changegroupactive f
else
  hyprctl dispatch cyclenext
fi
''
