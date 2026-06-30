{ ... }:
{
  imports = [
    # System
    ./system/base.nix
    ./system/audio.nix
    ./system/bluetooth.nix
    ./system/compositor.nix
    ./system/file-manager.nix
    ./system/fonts.nix
    ./system/login.nix
    ./system/network.nix
    ./system/packages.nix
    ./system/polkit.nix
    ./system/virtual-camera.nix

    # User
    ./user/ez.nix

    # Home Manager
    ./home/config.nix
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "25.05"; # Do not Change this value
}
