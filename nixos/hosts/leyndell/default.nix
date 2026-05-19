{ inputs, ... }:
{
  imports = [
    ./hardware.nix
    ./disko.nix
    ./services.nix
    ../../configuration.nix
  ];

  networking.hostName = "leyndell";
}
