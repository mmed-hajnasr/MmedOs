{ pkgs }:
pkgs.writeShellScriptBin "theme-select" ''
  list_of_themes=$(${pkgs.jq}/bin/jq '.[]' ~/Wallpapers/aux.json | tr -d '"')
  for wal in $list_of_themes; do
    if [[ ! -f $wal ]]; then
      ${pkgs.jq}/bin/jq --arg key "$wal" 'del(.[$key])' ~/Wallpapers/aux.json > ~/Wallpapers/current.json
      cp ~/Wallpapers/current.json ~/Wallpapers/aux.json
      theme=$(basename $(dirname $wal))
      theme_folder=~/Wallpapers/$theme
      if [[ -z $(ls -A $theme_folder) ]]; then
        rmdir $theme_folder
      else 
        random_wall=$(ls $theme_folder | shuf -n 1)
        ${pkgs.jq}/bin/jq --arg key "$theme" --arg value "$theme_folder/$random_wall" '.[$key] = $value' ~/Wallpapers/aux.json > ~/Wallpapers/current.json
        cp ~/Wallpapers/current.json ~/Wallpapers/aux.json
      fi
    fi
  done
  list_of_themes=$(${pkgs.jq}/bin/jq '.[]' ~/Wallpapers/aux.json | tr -d '"')
  imgpath=$(nsxiv -tbo -s F $list_of_themes)
  if [[ ! $imgpath ]]; then
    exit 0
  fi
  swww img --transition-type none $imgpath
  theme=$(${pkgs.jq}/bin/jq -r --arg val "$imgpath" 'to_entries[] | select(.value == $val) | .key' ~/Wallpapers/aux.json)
  if [[ $theme == "aux" ]]; then
    flavours generate dark $imgpath
    flavours apply generated
  else 
    flavours apply $theme
  fi
''
