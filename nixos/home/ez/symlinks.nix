{
  config,
  inputs,
  lib,
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
  home = {
    file = mkDotfileLinks {
      files = {
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

  };

  xdg = {
    configFile = mkDotfileLinks {
      files = {
        "fastfetch/config.jsonc" = "configs/fastfetch.jsonc";
        "wlr-which-key/config.yaml" = "configs/wlr-which-key.yml";

        "hypr" = "hypr";
        "nvim" = "nvim";
        "quickshell" = "configs/quickshell";
      };
      store = false;
    };
  };
}
