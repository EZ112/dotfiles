{ ... }:
{
  programs.alacritty = {
    enable = true;
    theme = "gruvbox_dark";
    settings = {
      font = {
        size = 12.0;
        normal = {
          family = "Inconsolata Nerd Font";
          style = "Regular";
        };
        bold = {
          family = "Inconsolata Nerd Font";
          style = "Bold";
        };
        italic = {
          family = "Inconsolata Nerd Font";
          style = "Italic";
        };
      };
    };
  };
}
