{ ... }:
{
  imports = [
    ./hardware.nix
    ./disko.nix
    ./packages.nix
    ./services.nix
  ];

  networking.hostName = "nokron";
}
