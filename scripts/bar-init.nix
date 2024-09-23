{ pkgs }:
pkgs.writeShellScriptBin "bar-init" ''  
  CONFIG_FILES="$HOME/.config/waybar/config.jsonc $HOME/.config/waybar/style.css $HOME/.config/waybar/desc-colors.css"

  while true; do
      waybar &
      inotifywait -e create,modify $CONFIG_FILES
      pkill waybar
  done

''
