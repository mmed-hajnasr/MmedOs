{ pkgs, username, ... }:
{
  systemd.timers."daily_job" = {
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnCalendar = "daily";
      Persistent = true;
      Unit = "daily_job.service";
    };
  };

  systemd.services."daily_job" = {
    path = [
      (import ../scripts/daily.nix { inherit pkgs; })
      pkgs.git
      (import ../scripts/update_music.nix { inherit pkgs; })
    ];
    script = ''exec daily'';
    serviceConfig = {
      Type = "oneshot";
      User = "${username}";
    };
  };
}
