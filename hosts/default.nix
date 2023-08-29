inputs: let
  system = "x86_64-linux";
  sopsModule = inputs.sops-nix.nixosModules.sops;
  hmModule = inputs.home-manager.nixosModules.home-manager;
  hyprlandModule = inputs.hyprland.homeManagerModules.default;
  ironbarModule = inputs.ironbar.homeManagerModules.default;
  atticdModule = inputs.attic.nixosModules.atticd;
  inherit (inputs.nixpkgs.lib) nixosSystem;
in {
  tsuki = nixosSystem {
    inherit system;
    specialArgs = {inherit inputs;};
    modules = [
      ./tsuki
      sopsModule
      hmModule
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          extraSpecialArgs = {inherit inputs;};
          users.notoh = {
            imports = [
              ./tsuki/home.nix
              hyprlandModule
              ironbarModule
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
      sopsModule
      hmModule
      atticdModule
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
  kariru = nixosSystem {
    inherit system;
    specialArgs = {inherit inputs;};
    modules = [
      ./kariru
      sopsModule
      hmModule
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          users.notoh = {
            imports = [
              ./kariru/home.nix
            ];
          };
        };
      }
    ];
  };
  yuki = nixosSystem {
    inherit system;
    specialArgs = {inherit inputs;};
    modules = [
      ./yuki
      sopsModule
      hmModule
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          users.notoh = {
            imports = [
              ./yuki/home.nix
            ];
          };
        };
      }
    ];
  };
  ame = nixosSystem {
    inherit system;
    specialArgs = {inherit inputs;};
    modules = [
      ./ame
      sopsModule
      hmModule
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          users.notoh = {
            imports = [
              ./ame/home.nix
            ];
          };
        };
      }
    ];
  };
  arashi = nixosSystem {
    inherit system;
    specialArgs = {inherit inputs;};
    modules = [
      ./arashi
      sopsModule
      hmModule
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          users.notoh = {
            imports = [
              ./arashi/home.nix
            ];
          };
        };
      }
    ];
  };
  sora = nixosSystem {
    inherit system;
    specialArgs = {inherit inputs;};
    modules = [
      ./sora
      sopsModule
      hmModule
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          users.notoh = {
            imports = [
              ./sora/home.nix
            ];
          };
        };
      }
    ];
  };
}
