{
  pkgs,
  ...
}:

{
  networking = {
    wireless.iwd.enable = true;
    dhcpcd = {
      wait = "background";
      extraConfig = ''
        denyinterfaces bnep* bt* hci*
      '';
    };
    proxy = {
      default = "http://127.0.0.1:8080";
      noProxy = "127.0.0.1,localhost,*.local,10.0.0.0/8,192.168.0.0/16";
    };
  };

  systemd.services.spoofdpi = {
    description = "Simple and fast anti-censorship proxy tool";
    after = [ "network.target" ];
    wantedBy = [ "multi-user.target" ];

    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.spoofdpi}/bin/spoofdpi --listen-addr 127.0.0.1:8080 --dns-addr 1.1.1.1:53 --dns-mode https";
      Restart = "on-failure";
      RestartSec = "5s";

      ProtectSystem = "full";
      NoNewPrivileges = true;
    };
  };
}
