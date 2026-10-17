{ ... }:
{
  boot.loader = {
    systemd-boot = {
      enable = true;
      configurationLimit = 10;
      consoleMode = "max";
    };

    efi.canTouchEfiVariables = true;
    timeout = 5;
  };

  services.upower.enable = true;

  time.timeZone = "Asia/Jakarta";
}
