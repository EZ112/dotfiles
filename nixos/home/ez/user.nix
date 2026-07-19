{ ... }:
{
  nixpkgs.config.allowUnfree = true;

  imports = [
    ./packages.nix
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
        "application/pdf" = "brave-browser.desktop";
        "inode/directory" = "pcmanfm.desktop";
        "video/*" = "mpv.desktop";
      };
    };
  };
}
