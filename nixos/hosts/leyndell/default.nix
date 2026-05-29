{ inputs, ... }:
{
  imports = [
    ./hardware.nix
    ./disko.nix
    ./cuda.nix
    ./lib.nix
    ./services.nix
    ../../configuration.nix
  ];

  networking.hostName = "leyndell";
}
