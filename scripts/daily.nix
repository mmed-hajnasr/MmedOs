{ pkgs }:
pkgs.writeShellScriptBin "daily" ''  
 update_music
 cd ~/Wallpaper
 commit_msg=$(date)
 git add .
 git commit -am "$commit_msg"
 git push
''
