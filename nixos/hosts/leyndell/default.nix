{ ... }:
{
  imports = [
    ./hardware.nix
    ./disko.nix
    ./cuda.nix
    ./packages.nix
    ./services.nix
    ../../configuration.nix
  ];

  networking.hostName = "leyndell";
}
