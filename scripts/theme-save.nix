{ pkgs }:
pkgs.writeShellScriptBin "theme-save" ''
  theme=$(flavours current)
  if [[ $theme == "generated" ]]; then
    ${pkgs.libnotify}/bin/notify-send "Error" "You can't save a generated theme"
    exit 1
  fi
  current_wallpaper=$(swww query | head -n 1 | cut -d ' ' -f 8)
  theme_exists=true
  if [[ ! -d ~/Wallpapers/$theme ]]; then
    theme_exists=false
  fi
  mkdir -p ~/Wallpapers/$theme
  base=$(basename $current_wallpaper)
  target_wallpaper=/home/$(whoami)/Wallpapers/$theme/$base
  mv $current_wallpaper $target_wallpaper
  ${pkgs.jq}/bin/jq --arg key "$theme" --arg value "$target_wallpaper" '.[$key] = $value' ~/Wallpapers/aux.json > ~/Wallpapers/current.json
  mv ~/Wallpapers/current.json ~/Wallpapers/aux.json
  swww img --transition-type none $target_wallpaper --outputs eDP-1,HDMI-A-1
  cp $target_wallpaper ~/.current_wallpaper
  if [[ $theme_exists == false ]]; then
    ${pkgs.libnotify}/bin/notify-send -i $target_wallpaper "Theme saved" "The theme $theme has been saved"
  else
    ${pkgs.libnotify}/bin/notify-send -i $target_wallpaper "Wallpaper moved" "The wallpaper has been moved to the $theme theme"
  fi
''
