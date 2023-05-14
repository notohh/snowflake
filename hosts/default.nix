inputs: let
  system = "x86_64-linux";
  inherit (inputs.nixpkgs.lib) nixosSystem;
in {
  tsuki = nixosSystem {
    inherit system;
    specialArgs = {inherit inputs;};
    modules = [
      ./tsuki
      inputs.sops-nix.nixosModules.sops
      inputs.home-manager.nixosModules.home-manager
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          extraSpecialArgs = {inherit inputs;};
          users.notoh = {
            imports = [
              ./tsuki/home.nix
              inputs.hyprland.homeManagerModules.default
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
      inputs.sops-nix.nixosModules.sops
      inputs.home-manager.nixosModules.home-manager
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          extraSpecialArgs = {inherit inputs;};
          users.oh = {
            imports = [
              ./hime/home.nix
            ];
          };
        };
      }
    ];
  };
  sutakku = nixosSystem {
    inherit system;
    modules = [
      ./sutakku
      inputs.sops-nix.nixosModules.sops
      inputs.home-manager.nixosModules.home-manager
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          users.oh = {
            imports = [
              ./sutakku/home.nix
            ];
          };
        };
      }
    ];
  };
  sakura = nixosSystem {
    inherit system;
    specialArgs = {inherit inputs;};
    modules = [
      ./sakura
      inputs.sops-nix.nixosModules.sops
      inputs.home-manager.nixosModules.home-manager
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          users.notoh = {
            imports = [
              ./sakura/home.nix
            ];
          };
        };
      }
    ];
  };
}
