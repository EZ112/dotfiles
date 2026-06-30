{ ... }:
{
  nixpkgs.config.allowUnfree = true;

  imports = [
    ./packages.nix
    ./ssh.nix
    ./symlinks.nix
    ./variables.nix

    ./programs
    ./services
    ./themes
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
