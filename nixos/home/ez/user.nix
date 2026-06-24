{
  config,
  lib,
  inputs,
  pkgs,
  ...
}:

let
  dotfilesDir = "${config.home.homeDirectory}/dotfiles";
  mkDotfileLinks =
    {
      files,
      store ? true,
    }:
    builtins.mapAttrs (name: value: {
      source =
        if store then
          inputs.self + value
        else
          config.lib.file.mkOutOfStoreSymlink "${dotfilesDir}/${value}";
    }) files;
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

      # Shell toolkit
      quickshell

      # Package manager
      luajitPackages.luarocks

      # LSP
      nixd
      jdt-language-server
      lombok
      lua-language-server
      vscode-langservers-extracted
      typescript-language-server
      tailwindcss-language-server
      emmet-ls
      kdePackages.qtdeclarative
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

    file = mkDotfileLinks {
      files = {
        ".bashrc_local.example" = ".bashrc_local.example";
        ".claude/skills" = "ai/claude/skills";
      };
      store = false;
    };

    activation = {
      initQmlls = lib.hm.dag.entryAfter [ "writeBoundary" "linkGeneration" ] ''
        if [ ! -f "$HOME/.config/quickshell/.qmlls.ini" ]; then
          touch "$HOME/.config/quickshell/.qmlls.ini"
        fi
      '';
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

    configFile =
      mkDotfileLinks {
        files = {
          "dunst/dunstrc" = "configs/dunstrc";
          "fastfetch/config.jsonc" = "configs/fastfetch.jsonc";
          "mpv/input.conf" = "configs/mpv.conf";
          "starship.toml" = "configs/starship.toml";
          "wlr-which-key/config.yaml" = "configs/wlr-which-key.yml";

          "hypr" = "hypr";
          "nvim" = "nvim";
          "quickshell" = "configs/quickshell";
        };
        store = false;
      }
      // mkDotfileLinks {
        files = {
          "yazi/keymap.toml" = /configs/yazi/keymap.toml;
          "yazi/flavors" = /configs/yazi/flavors;
        };
      };
  };
}
