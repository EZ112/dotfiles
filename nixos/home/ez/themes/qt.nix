{ pkgs, ... }:
{
  qt = {
    enable = true;
    style.name = "kvantum";
    platformTheme.name = "qtct";
    kvantum = {
      enable = true;
      themes = [
        pkgs.gruvbox-kvantum
      ];
      settings = {
        General.theme = "Gruvbox-Dark-Brown";
      };
    };
  };
}
