{ pkgs ? import <nixpkgs> { } }:
pkgs.writeShellScriptBin "mute-ads" ''  
  muted=false
  block="Advertisement"
  while true; do
    sleep 2;
    song_title=$(playerctl metadata | grep 'xesam:title' | cut -d' ' -f3- | tr -d ' ')
    if [ "$muted" = false -a $song_title = $block ]; then
      id=$(${pkgs.pulseaudio}/bin/pactl list sink-inputs | grep -B 20 "application.name = \"spotify\"" | grep "Sink Input" | awk '{print $3}' | tr -d '#')
      ${pkgs.pulseaudio}/bin/pactl set-sink-input-mute "$id" 1
      muted=true
      ${pkgs.libnotify}/bin/notify-send "Muted" "Spotify ads have been muted"
    elif [ "$muted" = true -a $song_title != $block ]; then
      id=$(${pkgs.pulseaudio}/bin/pactl list sink-inputs | grep -B 20 "application.name = \"spotify\"" | grep "Sink Input" | awk '{print $3}' | tr -d '#')
      ${pkgs.pulseaudio}/bin/pactl set-sink-input-mute "$id" 0
      ${pkgs.libnotify}/bin/notify-send "Unmuted" "Music have been unmuted"
      muted=false
    fi
  done
''
