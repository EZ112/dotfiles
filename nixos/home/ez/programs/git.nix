{ ... }:
{
  programs.git = {
    enable = true;
    settings = {
      init.defaultBranch = "main";
      user = {
        name = "Izzi";
        email = "izzidz@gmail.com";
      };
      core.editor = "nvim";
    };
  };
}
