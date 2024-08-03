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
    catppuccin-waybar = {
      url = "github:catppuccin/waybar";
      flake = false;
    };
  };

  outputs = inputs @ { self, home-manager, nix-darwin, nixos-hardware, nixpkgs, ... }:
    let
      lib = nixpkgs.lib;
    in
    {
      darwinConfigurations = {
        europa = nix-darwin.lib.darwinSystem {
          system = "aarch64-darwin";
          modules = [
            ./hosts/europa/configuration.nix
          ];
        };
      };

      nixosConfigurations = {
        enceladus = lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            nixos-hardware.nixosModules.apple-macbook-pro-12-1
            ./hosts/enceladus/configuration.nix
          ];
        };

        titan = lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./hosts/titan/configuration.nix
          ];
        };

        io = lib.nixosSystem
          {
            system = "aarch64-linux";
            modules = [
              nixos-hardware.nixosModules.raspberry-pi-4
              ./hosts/io/configuration.nix
            ];
          };
      };

      homeConfigurations = {
        "matt@europa" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages."aarch64-darwin";
          modules = [
            ./hosts/europa/home.nix
          ];
        };

        "matt@enceladus" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages."x86_64-linux";
          modules = [
            ./hosts/enceladus/home.nix
          ];
          extraSpecialArgs = { inherit inputs; };
        };

        "matt@titan" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages."x86_64-linux";
          modules = [
            ./hosts/titan/home.nix
          ];
          extraSpecialArgs = { inherit inputs; };
        };

        "matt@io" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages."aarch64-linux";
          modules = [
            ./hosts/io/home.nix
          ];
          extraSpecialArgs = { inherit inputs; };
        };
      };
    };
}
