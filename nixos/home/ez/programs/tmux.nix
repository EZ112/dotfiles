{ pkgs, inputs, ... }:
{
  programs.tmux = {
    enable = true;
    shortcut = "Space";
    baseIndex = 1;
    escapeTime = 0;
    plugins = with pkgs; [
      tmuxPlugins.gruvbox
    ];
    extraConfig = builtins.readFile (inputs.self + /configs/tmux.conf);
  };
}
