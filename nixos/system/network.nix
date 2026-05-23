{
  config,
  lib,
  pkgs,
  ...
}:

{
  networking = {
    wireless.iwd.enable = true;
    dhcpcd = {
      wait = "background";
      extraConfig = ''
        denyinterfaces bnep* bt* hci*
      '';
    };
  };
}
