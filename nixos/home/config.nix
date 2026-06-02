{
  config,
  inputs,
  lib,
  pkgs,
  ...
}:

{
  home-manager = {
    extraSpecialArgs = { inherit inputs; };

    users.ez = ./ez/user.nix;
    backupFileExtension = "backup";
  };
}
