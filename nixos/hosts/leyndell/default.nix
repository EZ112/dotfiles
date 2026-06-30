{ ... }:
{
  imports = [
    ./hardware.nix
    ./disko.nix
    ./cuda.nix
    ./packages.nix
    ./services.nix
  ];

  networking.hostName = "leyndell";
}
