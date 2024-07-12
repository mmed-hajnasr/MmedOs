{ pkgs }:
pkgs.writeShellScriptBin "waybar-init" ''  
  CONFIG_FILES="$HOME/.config/waybar/config.jsonc $HOME/.config/style.css $HOME/.config/waybar/desc-colors.css"

  trap "pkill waybar" EXIT

  while true; do
      waybar &
      inotifywait -e create,modify $CONFIG_FILES
      pkill waybar
  done

''
