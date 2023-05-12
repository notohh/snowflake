inputs: let
  system = "x86_64-linux";
  inherit (inputs.nixpkgs.lib) nixosSystem;
in {
  tsuki = nixosSystem {
    inherit system;
    modules = [
      ./tsuki
      inputs.home-manager.nixosModules.home-manager
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          extraSpecialArgs = {inherit inputs;};
          users.notoh = {
            imports = [
              inputs.hyprland.homeManagerModules.default
              ./tsuki/home.nix
            ];
          };
        };
      }
    ];
  };
  hime = nixosSystem {
    inherit system;
    modules = [
      ./hime
      inputs.home-manager.nixosModules.home-manager
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          users.oh = {imports = [./hime/home.nix];};
        };
      }
    ];
  };
  sutakku = nixosSystem {
    inherit system;
    modules = [
      ./sutakku
      inputs.home-manager.nixosModules.home-manager
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          users.oh = {
            imports = [./sutakku/home.nix];
          };
        };
      }
    ];
  };
  sakura = nixosSystem {
    inherit system;
    modules = [
      ./sakura
      inputs.home-manager.nixosModules.home-manager
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          users.notoh = {
            imports = [./sakura/home.nix];
          };
        };
      }
    ];
  };
}
