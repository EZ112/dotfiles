{ ... }:
{
  imports = [
    ./hardware.nix
    ./disko.nix
    ./packages.nix
    ./services.nix
    ../../configuration.nix
  ];

  networking.hostName = "nokron";
}
