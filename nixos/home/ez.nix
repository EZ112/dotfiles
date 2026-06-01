{
  config,
  pkgs,
  ...
}:

{
  home.username = "ez";
  home.homeDirectory = "/home/ez";

  home.sessionVariables = import ./variables.nix;

  nixpkgs.config.allowUnfree = true;

  imports = [
    ./programs.nix
    ./services.nix
    ./workspaces.nix
    ./ssh.nix
    ./gtk.nix
  ];

  home.packages = with pkgs; [
    waybar # Bar
    font-manager # Font
    awww # Wallpaper
    rofi # Window switcher

    # Notification
    dunst
    libnotify

    # Compiler
    gcc

    # Calendar
    gcalcli

    # Chat
    discord

    # AI
    claude-code

    # Devtool
    bruno
    devtoolbox

    # File manager
    pcmanfm

    # Package manager
    luajitPackages.luarocks

    # LSP
    jdt-language-server
    lombok
    lua-language-server
    vscode-langservers-extracted
    typescript-language-server
    tailwindcss-language-server
    emmet-ls
    basedpyright
    ruff

    # Lint
    eslint_d

    # Formatter
    google-java-format
    prettierd
    stylua
    xmlformat
    nixfmt
  ];

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "inode/directory" = "pcmanfm.desktop";
    };
  };

  home.file = {
    ".bashrc_local.example".source = ../../.bashrc_local.example;
    ".claude/skills".source = ../../claude/skills;
  };

  xdg.configFile = {
    # File
    "hypr/hyprland.conf".source = ../../hypr/hyprland.conf;
    "hypr/hyprlock.conf".source = ../../hypr/hyprlock.conf;
    "nvim/init.lua".source = ../../nvim/init.lua;
    "nvim/stylua.toml".source = ../../nvim/stylua.toml;
    "starship.toml".source = ../../starship.toml;
    "yazi/keymap.toml".source = ../../yazi/keymap.toml;

    # Directory
    "dunst".source = ../../dunst;
    "mpv".source = ../../mpv;
    "nvim/lua".source = ../../nvim/lua;
    "nvim/lsp".source = ../../nvim/lsp;
    "rofi".source = ../../rofi;
    "waybar".source = ../../waybar;
    "yazi/flavors".source = ../../yazi/flavors;
  };

  home.stateVersion = "25.05"; # Do not Change this value
}
