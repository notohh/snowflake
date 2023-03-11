{
  description = "snowflake";
  
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
     };  
    hyprland.url = "github:hyprwm/Hyprland";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = { self, nixpkgs, home-manager, hyprland, flake-utils, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };

      lib = nixpkgs.lib;

    in {
      nixosConfigurations = {
        tsuki = lib.nixosSystem {
          inherit system;
          modules = [
            ./hosts/tsuki
            home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.notoh = {
              imports = [
                hyprland.homeManagerModules.default
                ./hosts/tsuki/home.nix
              ];
            };
          }
        ];
      };
        hime = lib.nixosSystem {
          inherit system;
          modules = [
            ./hosts/hime
            home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.oh = {
              imports = [
                ./hosts/hime/home.nix
              ];
            };
          }
        ];
      };
       sutakku = lib.nixosSystem {
        inherit system;
        modules = [
          ./hosts/sutakku
          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.oh = {
              imports = [
                ./hosts/sutakku/home.nix
              ];
            };
          }
        ];
      };
    };
  };    
}
