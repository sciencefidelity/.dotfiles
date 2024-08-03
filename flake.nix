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
        dia = nix-darwin.lib.darwinSystem {
          system = "aarch64-darwin";
          modules = [
            ./hosts/dia/configuration.nix
          ];
        };
      };

      nixosConfigurations = {
        sao = lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./hosts/titan/configuration.nix
          ];
        };

        eris = lib.nixosSystem {
          system = "aarch64-linux";
          modules = [
            nixos-hardware.nixosModules.raspberry-pi-4
            ./hosts/eris/configuration.nix
          ];
        };

        rhea = lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            nixos-hardware.nixosModules.apple-macbook-pro-12-1
            ./hosts/rhea/configuration.nix
          ];
        };
      };

      homeConfigurations = {
        "matt@dia" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages."aarch64-darwin";
          modules = [
            ./hosts/dia/home.nix
          ];
        };

        "matt@sao" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages."x86_64-linux";
          modules = [
            ./hosts/sao/home.nix
          ];
          extraSpecialArgs = { inherit inputs; };
        };

        "matt@eris" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages."aarch64-linux";
          modules = [
            ./hosts/eris/home.nix
          ];
          extraSpecialArgs = { inherit inputs; };
        };

        "matt@rhea" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages."x86_64-linux";
          modules = [
            ./hosts/rhea/home.nix
          ];
          extraSpecialArgs = { inherit inputs; };
        };
      };
    };
}
