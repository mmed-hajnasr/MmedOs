{ pkgs }:
pkgs.writeShellScriptBin "wall-select" ''  
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
  if [[ ! -d ~/Wallpapers/$theme ]] || [[ $generate == true ]]; then
    theme="aux"
    generate=true
  fi
  wallpapers_source=~/Wallpapers/$theme
  if [[ $all == true ]]; then
    wallpapers_source=~/Wallpapers/aux
  fi
  imgpath=$(nsxiv -tbor -s F $wallpapers_source)
  if [[ ! $imgpath ]]; then
    exit 0
  fi
  swww img --transition-type random $imgpath
  cp $imgpath ~/.current_wallpaper
  if [[ $all == false ]] && [[ $generate == false ]]; then
    ${pkgs.jq}/bin/jq --arg key "$theme" --arg value "$imgpath" '.[$key] = $value' ~/Wallpapers/aux.json > ~/Wallpapers/current.json
    mv ~/Wallpapers/current.json ~/Wallpapers/aux.json
  fi
  if [[ $generate == true ]]; then
    flavours generate dark $imgpath
    flavours apply generated
  fi
''
