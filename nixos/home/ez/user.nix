{ ... }:
{
  nixpkgs.config.allowUnfree = true;

  imports = [
    ./gtk.nix
    ./packages.nix
    ./services.nix
    ./ssh.nix
    ./symlinks.nix
    ./variables.nix

    ./programs
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
        "video/*" = "mpv.desktop";
      };
    };
  };
}
