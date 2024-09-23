{ pkgs }:

pkgs.writeShellScriptBin "notification-center" ''
  sleep 0.1
  ${pkgs.swaynotificationcenter}/bin/swaync-client -t &
''
