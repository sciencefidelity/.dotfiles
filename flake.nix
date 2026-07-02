{
  description = "Matt's NixOS Configuration";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nixpkgs-darwin.url = "nixpkgs/nixpkgs-unstable";
    nixos-hardware.url = "nixos-hardware/master";
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs-darwin";
    };
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { home-manager, nix-darwin, nixos-hardware, nixpkgs, nixpkgs-darwin, flake-utils, ... } @inputs:
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

        ceres = nix-darwin.lib.darwinSystem {
          system = "aarch64-darwin";
          modules = [
            ./hosts/ceres/configuration.nix
          ];
        };
      };

      nixosConfigurations = {
        io = lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./hosts/io/configuration.nix
          ];
        };

        sao = lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./hosts/sao/configuration.nix
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
          pkgs = nixpkgs-darwin.legacyPackages."aarch64-darwin";
          modules = [
            ./hosts/dia/home.nix
          ];
        };

        "matt@ceres" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs-darwin.legacyPackages."aarch64-darwin";
          modules = [
            ./hosts/ceres/home.nix
          ];
        };

        "matt@io" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages."x86_64-linux";
          modules = [
            ./hosts/io/home.nix
          ];
        };

        "matt@sao" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages."x86_64-linux";
          modules = [
            ./hosts/sao/home.nix
          ];
        };

        "matt@eris" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages."aarch64-linux";
          modules = [
            ./hosts/eris/home.nix
          ];
        };

        "matt@rhea" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages."x86_64-linux";
          modules = [
            ./hosts/rhea/home.nix
          ];
        };
      };
    }
    //
    flake-utils.lib.eachDefaultSystem (system:
      let
        overlays = [ ];
        pkgs = import nixpkgs {
          inherit system overlays;
        };
      in
      with pkgs;
      {
        devShells.default = mkShell {
          buildInputs = [
            lua5_4_compat
            lua-language-server
            stylua
          ];

          shellHook = /*bash*/ ''
            git pull
          '';
        };
      }
    );
}
