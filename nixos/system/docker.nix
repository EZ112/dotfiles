{ config, ... }:
{
  virtualisation.docker = {
    enable = false;

    rootless = {
      enable = true;
      setSocketVariable = true;

      daemon.settings = {
        data-root = "${config.users.users.ez.home}/.local/share/docker";
        dns = [
          "1.1.1.1"
          "8.8.8.8"
        ];
        registry-mirrors = [ "https://mirror.gcr.io" ];
      };
    };
  };
}
