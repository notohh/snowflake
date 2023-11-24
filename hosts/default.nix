inputs: let
  system = "x86_64-linux";
  sopsModule = inputs.sops-nix.nixosModules.sops;
  hmModule = inputs.home-manager.nixosModules.home-manager;
  hyprlandModule = inputs.hyprland.homeManagerModules.default;
  ironbarModule = inputs.ironbar.homeManagerModules.default;
  nix-index-Module = inputs.nix-index-database.hmModules.nix-index;
  anyrunModule = inputs.anyrun.homeManagerModules.default;
  agsModule = inputs.ags.homeManagerModules.default;
  stylixModule = inputs.stylix.homeManagerModules.stylix;
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
              nix-index-Module
              anyrunModule
              agsModule
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
  tsuru = nixosSystem {
    inherit system;
    specialArgs = {inherit inputs;};
    modules = [
      ./tsuru
      sopsModule
      hmModule
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          users.notoh = {
            imports = [
              ./tsuru/home.nix
            ];
          };
        };
      }
    ];
  };
}
