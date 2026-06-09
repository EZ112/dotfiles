{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    disko = {
      url = "github:nix-community/disko/latest";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      disko,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      commonModules = [
        home-manager.nixosModules.home-manager
        disko.nixosModules.disko
      ];
      mkHost =
        host:
        nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs; };
          modules = [ ./nixos/hosts/${host} ] ++ commonModules;
        };
    in
    {
      nixosConfigurations = {
        leyndell = mkHost "leyndell";
        nokron = mkHost "nokron";
      };
    };
}
