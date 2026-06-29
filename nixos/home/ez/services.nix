{
  inputs,
  pkgs,
  ...
}:

let
  calendarNotifier = pkgs.writeShellScriptBin "calendar-notifier" ''
    EVENTS=$(${pkgs.gcalcli}/bin/gcalcli remind 15 'echo %s')

    if [ ! -z "$EVENTS" ]; then
      ${pkgs.libnotify}/bin/notify-send -a "Google Calendar" "Upcoming Event" "$EVENTS"
      ${pkgs.pipewire}/bin/pw-play ${inputs.self + /sfx/notification.oga}
    fi
  '';
in
{
  systemd.user = {
    services.gcal-notifier = {
      Unit = {
        Description = "Google Calendar Notifier";
        After = [ "network-online.target" ];
      };

      Service = {
        Type = "oneshot";
        ExecStart = "${calendarNotifier}/bin/calendar-notifier";
      };
    };

    timers.gcal-notifier = {
      Unit = {
        Description = "Run gcal-notifier every 5 minutes";
      };
      Timer = {
        OnBootSec = "2m";
        OnUnitActiveSec = "5m";
        Persistent = true;
      };
      Install = {
        WantedBy = [ "timers.target" ];
      };
    };
  };
}
