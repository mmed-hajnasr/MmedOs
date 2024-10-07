{ pkgs ? import <nixpkgs> { } }:
pkgs.writeShellScriptBin "mute-ads" ''  
  muted=false
  block="Advertisement"
  while true; do
    sleep 1;
    song_title=$(playerctl metadata | grep 'xesam:title' | cut -d' ' -f3- | tr -d ' ')
    if [ "$muted" = false -a $song_title = $block ]; then
      amixer set Master mute
      muted=true
      ${pkgs.libnotify}/bin/notify-send "Muted" "Spotify ads have been muted"
    elif [ "$muted" = true -a $song_title != $block ]; then
      amixer set Master unmute
      ${pkgs.libnotify}/bin/notify-send "Unmuted" "Music have been unmuted"
      muted=false
    fi
  done
''
