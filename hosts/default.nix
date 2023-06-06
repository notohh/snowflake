inputs: let
  system = "x86_64-linux";
  sopsModule = inputs.sops-nix.nixosModules.sops;
  hmModule = inputs.home-manager.nixosModules.home-manager;
  diskoModule = inputs.disko.nixosModules.disko;
  hyprlandModule = inputs.hyprland.homeManagerModules.default;
  ironbarModule = inputs.ironbar.homeManagerModules.default;
  inherit (inputs.nixpkgs.lib) nixosSystem;
in {
  tsuki = nixosSystem {
    inherit system;
    specialArgs = {inherit inputs;};
    modules = [
      ./tsuki
      sopsModule
      diskoModule
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
      diskoModule
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
      diskoModule
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
      diskoModule
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
}
