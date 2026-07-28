{ ... }:
{
  users.users.ez = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "docker"
    ];
  };

  nix.settings.trusted-users = [
    "root"
    "ez"
  ];
}
