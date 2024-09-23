{ pkgs }:
pkgs.writeShellScriptBin "get-polarity" ''
  theme=$(flavours current)
  if [[ $theme == "generated" ]]; then
    echo "dark"
    exit 0
  fi
  polarity=$(${pkgs.jq}/bin/jq -r --arg key "$theme" '.[$key]' ~/Wallpapers/polarity.json)
  if [[ $polarity == "null" ]]; then
    echo "dark"
  else
    echo $polarity
  fi
''
