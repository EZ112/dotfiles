{ ... }:

{
  services.ssh-agent.enable = true;

  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    settings = {
      "github-personal" = {
        hostname = "github.com";
        identityFile = "~/.ssh/github_personal";
        addKeysToAgent = "yes";
      };
    };
  };
}
