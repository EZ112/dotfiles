{
  config,
  inputs,
  pkgs,
  osConfig,
  ...
}:

let
  hostname = osConfig.networking.hostName;
  mapDotfiles = files: builtins.mapAttrs (name: value: { source = inputs.self + value; }) files;
in
{
  nixpkgs.config.allowUnfree = true;

  imports = [
    ./programs.nix
    ./services.nix
    ./ssh.nix
    ./gtk.nix
  ];

  home = {
    username = "ez";
    homeDirectory = "/home/ez";
    sessionVariables = import ./variables.nix { inherit pkgs; };
    packages = with pkgs; [
      wlr-which-key # App launcher
      waybar # Bar
      font-manager # Font

      # Wallpaper
      awww
      waypaper

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

    file = mapDotfiles {
      ".bashrc_local.example" = /.bashrc_local.example;
      ".claude/skills" = /claude/skills;
    };

    stateVersion = "25.05"; # Do not Change this value
  };

  xdg = {
    mimeApps = {
      enable = true;
      defaultApplications = {
        "inode/directory" = "pcmanfm.desktop";
      };
    };

    configFile = mapDotfiles {
      # File
      "fastfetch/config.jsonc" = /fastfetch/config.jsonc;
      "hypr/general.lua" = /hypr/general.lua;
      "hypr/hyprland.lua" = /hypr/hyprland.lua;
      "hypr/keybinds.lua" = /hypr/keybinds.lua;
      "hypr/hyprlock.conf" = /hypr/hyprlock.conf;
      "hypr/utils.lua" = /hypr/utils.lua;
      "hypr/workspaces.lua" = /hypr/workspaces.lua;
      "hypr/${hostname}/workspaces.lua" = /hypr/${hostname}/workspaces.lua;
      "nvim/init.lua" = /nvim/init.lua;
      "nvim/stylua.toml" = /nvim/stylua.toml;
      "starship.toml" = /starship.toml;
      "yazi/keymap.toml" = /yazi/keymap.toml;

      # Directory
      "dunst" = /dunst;
      "mpv" = /mpv;
      "nvim/lua" = /nvim/lua;
      "nvim/lsp" = /nvim/lsp;
      "waybar" = /waybar;
      "wlr-which-key" = /wlr-which-key;
      "yazi/flavors" = /yazi/flavors;
    };
  };
}
