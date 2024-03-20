{
  description = "Matt's NixOS Configuration";

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
        nixbook = lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            nixos-hardware.nixosModules.apple-macbook-pro-12-1
            ./hosts/nixos/config.nix
            ./hosts/nixos/configuration.nix
          ];
        };

        nixos = lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./hosts/nixos/config.nix
            ./hosts/nixos/configuration.nix
          ];
        };

        pi = lib.nixosSystem {
          system = "aarch64-linux";
          modules = [
            nixos-hardware.nixosModules.raspberry-pi-4
            ./hosts/pi/config.nix
            ./hosts/pi/configuration.nix
          ];
        };
      };

      homeConfigurations = {
        "matt@nixbook" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages."x86_64-linux";
          modules = [
            ./hosts/nixos/config.nix
            ./hosts/nixbook/home.nix
          ];
        };

        "matt@nixos" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages."x86_64-linux";
          modules = [
            ./hosts/nixos/config.nix
            ./home.nix
          ];
        };

        "matt@pi" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages."aarch64-linux";
          modules = [
            ./hosts/pi/config.nix
            ./home.nix
          ];
        };
      };
    };
}
