{ hostName, ... }:
{
  imports = [
    ./system
    ./user/ez.nix
    ./hosts/${hostName}
    ./home/config.nix
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "25.05"; # Do not Change this value
}
