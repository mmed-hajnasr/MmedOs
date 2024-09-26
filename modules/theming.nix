{ pkgs, ... }:
{
  home.packages = (with pkgs; [
    nsxiv
    flavours
    swww
    neofetch
    xorg.xrdb
    (import ../scripts/ghosts.nix { inherit pkgs; })
    (import ../scripts/squirtle.nix { inherit pkgs; })
    (import ../scripts/wall-select.nix { inherit pkgs; })
    (import ../scripts/theme-select.nix { inherit pkgs; })
    (import ../scripts/theme-save.nix { inherit pkgs; })
    (import ../scripts/get-polarity.nix { inherit pkgs; })
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
      mv ~/wallpapers/current.json ~/wallpapers/aux.json
      swww img --transition-type none ~/wallpapers/aux/$current_wallpaper
    '')
  ]);
}


