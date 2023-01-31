{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
     };  
    hyprland.url = "github:hyprwm/Hyprland";
  };
  outputs = { self, nixpkgs, home-manager, hyprland, ... }:
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
            ./hosts/tsuki/default.nix
            hyprland.nixosModules.default
            {programs.hyprland.enable = true;}
            home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.notoh = import ./modules/home/home.nix;
          }
        ];
      };
    };
  };
}
