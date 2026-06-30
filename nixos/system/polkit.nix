{ pkgs, ... }:
{
  security.polkit.enable = true;

  systemd.user.services.polkit-gnome = {
    description = "Polkit GNOME Agent";
    wantedBy = [ "hyprland-session.target" ];
    after = [ "hyprland-session.target" ];
    partOf = [ "hyprland-session.target" ];
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
      Restart = "on-failure";
      RestartSec = 1;
      TimeoutStopSec = 10;
    };
  };
}
