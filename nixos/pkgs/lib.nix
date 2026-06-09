{
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    # Build & Dev Tools
    gnumake
    neovim
    ripgrep
    devenv
    fzf
    fd

    # Network & Security
    keychain
    wget

    # Media & Audio
    ffmpeg
    jamesdsp
    mpv

    # Display & System
    systemd-manager-tui
    brightnessctl
    fastfetch

    # Clipboard & Utilities
    wl-clipboard
    impala
    unzip
  ];
}
