{ ... }:
{
  virtualisation.docker = {
    enable = false;

    rootless = {
      enable = true;
      setSocketVariable = true;

      daemon.settings = {
        data-root = "~/.local/docker";
        dns = [
          "1.1.1.1"
          "8.8.8.8"
        ];
        registry-mirrors = [ "https://mirror.gcr.io" ];
      };
    };
  };
}
