{ ... }:
{
  imports = [
    ./hardware.nix
    ./disko.nix
    ./lib.nix
    ./services.nix
    ../../configuration.nix
  ];

  networking.hostName = "nokron";
}
