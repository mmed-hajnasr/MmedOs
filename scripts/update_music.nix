{ pkgs }:
pkgs.writeShellScriptBin "update_music" ''  
  current_dir=$(pwd)
  cd ~/Music
  spotdl "https://open.spotify.com/playlist/0RcaDLYa2JzIcBwv2XFqQW?si=05a86b07cd4a4158"
  cd $current_dir
''
