{ inputs, pkgs, ... }:
{
  programs.yazi = {
    enable = true;
    flavors = {
      gruvbox-material = inputs.gruvbox-material-yazi;
    };

    theme = {
      flavor = {
        dark = "gruvbox-material";
        light = "gruvbox-material";
      };
    };
    plugins = {
      mount = pkgs.yaziPlugins.mount;
    };
    keymap = {
      mgr.prepend_keymap = [
        {
          run = "plugin mount";
          on = [ "M" ];
        }
      ];
    };
    settings = {
      opener = {
        play = [
          {
            run = "mpv %s";
            orphan = true;
            for = "unix";
          }
        ];
      };
      open.rules = [
        {
          mime = "video/*";
          use = "play";
        }
      ];
    };
    shellWrapperName = "y";
    extraPackages = [
      pkgs.ueberzugpp
    ];
  };
}
