{ ... }:
{
  nixpkgs.config.allowUnfree = true;

  imports = [
    ./gtk.nix
    ./packages.nix
    ./programs.nix
    ./services.nix
    ./symlinks.nix
    ./ssh.nix

    ./aliases.nix
    ./variables.nix
  ];

  home = {
    username = "ez";
    homeDirectory = "/home/ez";

    stateVersion = "25.05"; # Do not Change this value
  };

  xdg = {
    mimeApps = {
      enable = true;
      defaultApplications = {
        "inode/directory" = "pcmanfm.desktop";
      };
    };
  };
}
