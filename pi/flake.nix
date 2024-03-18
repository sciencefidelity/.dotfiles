{
  description = "Raspberry Pi system configuration";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nixos-hardware.url = "nixos-hardware/master";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, home-manager, nixos-hardware, nixpkgs, ... }:
    let
      lib = nixpkgs.lib;
    in
    {
      nixosConfigurations = {
        pi = lib.nixosSystem {
          system = "aarch64-linux";
          modules = [
            nixos-hardware.nixosModules.raspberry-pi-4
            ./hosts/pi/configuration.nix
          ];
        };

        nixos = lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./hosts/nixos/configuration.nix
          ];
        };
      };

      homeConfigurations = {
        matt = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages."aarch64-linux";
          modules = [ ./home.nix ];
        };
      };
    };
}
