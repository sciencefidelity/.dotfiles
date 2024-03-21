{
  description = "Matt's NixOS Configuration";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nixos-hardware.url = "nixos-hardware/master";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    catppuccin-hyprland = {
      url = "github:catppuccin/hyprland";
      flake = false;
    };
  };

  outputs = { self, home-manager, nix-darwin, nixos-hardware, nixpkgs, ... }:
    # let
    #   lib = nixpkgs.lib;
    # in
    {
      darwinConfigurations = {
        macbook = nix-darwin.lib.darwinSystem {
          system = "aarch64-darwin";
          modules = [
            ./hosts/macbook/config.nix
            ./hosts/macbook/configuration.nix
          ];
        };
      };
      nixosConfigurations = {
        nixbook = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            nixos-hardware.nixosModules.apple-macbook-pro-12-1
            ./hosts/nixbook/config.nix
            ./hosts/nixbook/configuration.nix
          ];
        };

        nixos = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./hosts/nixos/config.nix
            ./hosts/nixos/configuration.nix
          ];
        };

        pi = nixpkgs.lib.nixosSystem {
          system = "aarch64-linux";
          modules = [
            nixos-hardware.nixosModules.raspberry-pi-4
            ./hosts/pi/config.nix
            ./hosts/pi/configuration.nix
          ];
        };
      };

      homeConfigurations = {
        "matt@macbook" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages."aarch64-darwin";
          modules = [
            ./hosts/macbook/config.nix
            ./hosts/macbook/home.nix
          ];
        };

        "matt@nixbook" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages."x86_64-linux";
          modules = [
            ./hosts/nixbook/config.nix
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
