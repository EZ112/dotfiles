{
  inputs,
  hostName,
  ...
}:
{
  home-manager = {
    extraSpecialArgs = { inherit inputs hostName; };

    users.ez = ./ez/user.nix;
    backupFileExtension = "backup";
  };
}
