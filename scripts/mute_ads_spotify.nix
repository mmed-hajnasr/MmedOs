{ pkgs }:
pkgs.writeShellScriptBin "mute-ads" ''  
  block="Advertisement"
  while true; do
    sleep 1;
    song_title=$(dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:org.mpris.MediaPlayer2.Player string:Metadata | sed -n '/title/{n;p}' | cut -d '"' -f 2)
    if [ $song_title = $block ] ; then
      id=$(${pkgs.pulseaudio}/bin/pactl list sink-inputs | grep -B 20 "application.name = \"spotify\"" | grep "Sink Input" | awk '{print $3}' | tr -d '#')
      ${pkgs.pulseaudio}/bin/pactl set-sink-input-mute "$id" 1
    else
      id=$(${pkgs.pulseaudio}/bin/pactl list sink-inputs | grep -B 20 "application.name = \"spotify\"" | grep "Sink Input" | awk '{print $3}' | tr -d '#')
      ${pkgs.pulseaudio}/bin/pactl set-sink-input-mute "$id" 0
    fi
  done
''
