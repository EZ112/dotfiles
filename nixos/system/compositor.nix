{
  config,
  lib,
  pkgs,
  ...
}:

{
  # Hyprland
  programs.hyprland = {
    enable = true;
    withUWSM = true;
    xwayland.enable = true;
  };
  # hint electron app to use wayland
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  environment.systemPackages = with pkgs; [
    hyprshot
    hyprlock
  ];

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

  systemd.user.services.xdg-desktop-portal = {
    unitConfig = {
      After = [ "graphical-session.target" ];
    };
    serviceConfig = {
      Restart = "on-failure";
      RestartSec = "3s";
    };
  };

  systemd.user.services.xdg-desktop-portal-gtk = {
    unitConfig = {
      After = [ "graphical-session.target" ];
    };
    serviceConfig = {
      Restart = "on-failure";
      RestartSec = "3s";
    };
  };

  systemd.user.services.xdg-desktop-portal-hyprland = {
    unitConfig = {
      After = [ "graphical-session.target" ];
    };
    serviceConfig = {
      Restart = "on-failure";
      RestartSec = "3s";
    };
  };
}
