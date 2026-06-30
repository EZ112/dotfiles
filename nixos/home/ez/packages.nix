{ pkgs, ... }:
{
  home.packages = with pkgs; [
    wlr-which-key # App launcher
    brave # Browser
    font-manager # Font

    # Notification
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
    qt6.qtdeclarative
    qt6.qtmultimedia

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
}
