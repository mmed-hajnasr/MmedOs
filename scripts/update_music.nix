{ pkgs }:
pkgs.writeShellScriptBin "update_music" ''  
  current_dir=$(pwd)
  cd ~/Music
  spotdl --bitrate 192k "https://open.spotify.com/playlist/04Q0Qwj8qixYzWFWkqBIAt?si=88b536668bcb43bf"
  cd $current_dir
''
