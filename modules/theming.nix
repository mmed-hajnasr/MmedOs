{ pkgs, ... }:
{
  home.packages = (with pkgs; [
    nsxiv
    flavours
    swww
    xorg.xrdb
    libnotify
    jq
    (pkgs.writeShellScriptBin "wall-select" ''
      generate=false
      all=false
      print_usage() {
        printf "Usage: wall-select [-g]"
        printf "  -g: generate a theme from the selected wallpaper"
        printf "  -a: show all wallpapers"
      }

      while getopts 'ga' flag; do
        case "$flag" in
        g) generate=true ;;
        a) all=true ;;
        *)
          print_usage
          exit 1
          ;;
        esac
      done

      theme=$(flavours current)
      if [[ ! -d ~/wallpapers/$theme ]] || [[ $generate == true ]]; then
        theme="aux"
      fi
      wallpapers_source=~/wallpapers/$theme
      if [[ $all == true ]]; then
        wallpapers_source=~/wallpapers
      fi
      imgpath=$(nsxiv -tbor -s F $wallpapers_source)
      if [[ ! $imgpath ]]; then
        exit 0
      fi
      swww img --transition-type random $imgpath
      if [[ $all == false ]] && [[ $generate == false ]]; then
        jq --arg key "$theme" --arg value "$imgpath" '.[$key] = $value' ~/wallpapers/aux.json > ~/wallpapers/current.json
        cp ~/wallpapers/current.json ~/wallpapers/aux.json
      fi
      if [[ $generate == true ]]; then
        flavours generate dark $imgpath
        flavours apply generated
      fi
    '')
    (pkgs.writeShellScriptBin "theme-select" ''
      list_of_themes=$(jq '.[]' ~/wallpapers/aux.json | tr -d '"')
      for wal in $list_of_themes; do
        if [[ ! -f $wal ]]; then
          jq --arg key "$wal" 'del(.[$key])' ~/wallpapers/aux.json > ~/wallpapers/current.json
          cp ~/wallpapers/current.json ~/wallpapers/aux.json
          theme=$(basename $(dirname $wal))
          theme_folder=~/wallpapers/$theme
          if [[ -z $(ls -A $theme_folder) ]]; then
            rmdir $theme_folder
          else 
            random_wall=$(ls $theme_folder | shuf -n 1)
            jq --arg key "$theme" --arg value "$theme_folder/$random_wall" '.[$key] = $value' ~/wallpapers/aux.json > ~/wallpapers/current.json
            cp ~/wallpapers/current.json ~/wallpapers/aux.json
          fi
        fi
      done
      list_of_themes=$(jq '.[]' ~/wallpapers/aux.json | tr -d '"')
      imgpath=$(nsxiv -tbo -s F $list_of_themes)
      if [[ ! $imgpath ]]; then
        exit 0
      fi
      swww img --transition-type none $imgpath
      theme=$(jq -r --arg val "$imgpath" 'to_entries[] | select(.value == $val) | .key' ~/wallpapers/aux.json)
      if [[ $theme == "aux" ]]; then
        flavours generate dark $imgpath
        flavours apply generated
      else 
        flavours apply $theme
      fi
    '')
    (pkgs.writeShellScriptBin "theme-save" ''
      theme=$(flavours current)
      if [[ $theme == "generated" ]]; then
        notify-send "Error" "You can't save a generated theme"
        exit 1
      fi
      current_wallpaper=$(swww query | head -n 1 | cut -d ' ' -f 8)
      theme_exists=true
      if [[ ! -d ~/wallpapers/$theme ]]; then
        theme_exists=false
      fi
      mkdir -p ~/wallpapers/$theme
      base=$(basename $current_wallpaper)
      target_wallpaper=/home/$(whoami)/wallpapers/$theme/$base
      mv $current_wallpaper $target_wallpaper
      jq --arg key "$theme" --arg value "$target_wallpaper" '.[$key] = $value' ~/wallpapers/aux.json > ~/wallpapers/current.json
      cp ~/wallpapers/current.json ~/wallpapers/aux.json
      swww img --transition-type none $target_wallpaper
      if [[ $theme_exists == false ]]; then
        notify-send -i $current_wallpaper "Theme saved" "The theme $theme has been saved"
      else
        notify-send -i $current_wallpaper "Wallpaper moved" "The wallpaper has been moved to the $theme theme"
      fi
    '')
    (pkgs.writeShellScriptBin "theme-delete" ''
      theme=$(flavours current)
      if [[ $theme == "generated" ]]; then
        notify-send "Error" "You can't delete a generated theme"
        exit 1
      fi
      current_wallpaper=$(swww query | head -n 1 | cut -d ' ' -f 8)
      wal=$(basename $current_wallpaper)
      for file in ~/wallpapers/$theme/*; do
        mv $file ~/wallpapers/aux
        rmdir ~/wallpapers/$theme
      done
      jq --arg key "$theme" 'del(.[$key])' ~/wallpapers/aux.json > ~/wallpapers/current.json
      cp ~/wallpapers/current.json ~/wallpapers/aux.json
      swww img --transition-type none ~/wallpapers/aux/$current_wallpaper
    '')
  ]);
}


