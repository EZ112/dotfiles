{ ... }:
{
  programs.mpv = {
    enable = true;
    bindings = {
      "h" = "seek -20";
      "j" = "seek -5";
      "k" = "seek 5";
      "l" = "seek 20";
      "q" = "quit";
    };
  };
}
