{ pkgs, ... }:
{
  # Hyprland
  programs.hyprland = {
    enable = true;
    withUWSM = true;
    xwayland.enable = true;
  };

  environment = {
    # hint electron app to use wayland
    sessionVariables.NIXOS_OZONE_WL = "1";

    systemPackages = with pkgs; [
      hyprshot
      hyprlock
    ];
  };

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;

    extraPortals = [
      pkgs.xdg-desktop-portal-hyprland
      pkgs.xdg-desktop-portal-gtk
    ];

    config = {
      hyprland = {
        default = [
          "hyprland"
          "gtk"
        ];
      };

      common = {
        default = [ "gtk" ];
        "org.freedesktop.impl.portal.Screenshot" = [ "hyprland" ];
        "org.freedesktop.impl.portal.ScreenCast" = [ "hyprland" ];
      };
    };
  };

  systemd.user.services = {
    xdg-desktop-portal = {
      unitConfig = {
        After = [ "graphical-session.target" ];
      };
      serviceConfig = {
        Restart = "on-failure";
        RestartSec = "3s";
      };
    };
    xdg-desktop-portal-gtk = {
      unitConfig = {
        After = [ "graphical-session.target" ];
      };
      serviceConfig = {
        Restart = "on-failure";
        RestartSec = "3s";
      };
    };
    xdg-desktop-portal-hyprland = {
      unitConfig = {
        After = [ "graphical-session.target" ];
      };
      serviceConfig = {
        Restart = "on-failure";
        RestartSec = "3s";
      };
    };
  };
}
