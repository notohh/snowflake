{
  inputs,
  homeImports,
  ...
}: {
  flake.nixosConfigurations = let
    inherit (inputs.nixpkgs.lib) nixosSystem;
    specialArgs = {inherit inputs;};
    sopsModule = inputs.sops-nix.nixosModules.sops;
    hmModule = inputs.home-manager.nixosModules.home-manager;
    atticModule = inputs.attic.nixosModules.atticd;
    nurModule = inputs.nur.nixosModules.nur;
    t480Module = inputs.nixos-hardware.nixosModules.lenovo-thinkpad-t480;
  in {
    tsuki = nixosSystem {
      inherit specialArgs;
      modules = [
        ./tsuki
        sopsModule
        hmModule
        atticModule
        nurModule
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = specialArgs;
            users.notoh = {
              imports = homeImports."notoh@tsuki";
            };
          };
        }
      ];
    };
    sakura = nixosSystem {
      inherit specialArgs;
      modules = [
        ./sakura
        sopsModule
        hmModule
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = specialArgs;
            users.notoh = {
              imports = homeImports."default";
            };
          };
        }
      ];
    };
    kariru = nixosSystem {
      inherit specialArgs;
      modules = [
        ./kariru
        sopsModule
        hmModule
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = specialArgs;
            users.notoh = {
              imports = homeImports."default";
            };
          };
        }
      ];
    };
    yuki = nixosSystem {
      inherit specialArgs;
      modules = [
        ./yuki
        sopsModule
        hmModule
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = specialArgs;
            users.notoh = {
              imports = homeImports."default";
            };
          };
        }
      ];
    };
    ame = nixosSystem {
      inherit specialArgs;
      modules = [
        ./ame
        sopsModule
        hmModule
        t480Module
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = specialArgs;
            users.notoh = {
              imports = homeImports."notoh@ame";
            };
          };
        }
      ];
    };
    arashi = nixosSystem {
      inherit specialArgs;
      modules = [
        ./arashi
        sopsModule
        hmModule
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = specialArgs;
            users.notoh = {
              imports = homeImports."default";
            };
          };
        }
      ];
    };
    sora = nixosSystem {
      inherit specialArgs;
      modules = [
        ./sora
        sopsModule
        atticModule
        hmModule
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = specialArgs;
            users.notoh = {
              imports = homeImports."default";
            };
          };
        }
      ];
    };
    tsuru = nixosSystem {
      inherit specialArgs;
      modules = [
        ./tsuru
        sopsModule
        hmModule
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = specialArgs;
            users.notoh = {
              imports = homeImports."default";
            };
          };
        }
      ];
    };
    haru = nixosSystem {
      inherit specialArgs;
      modules = [
        ./haru
        sopsModule
        hmModule
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = specialArgs;
            users.notoh = {
              imports = homeImports."default";
            };
          };
        }
      ];
    };
    kaze = nixosSystem {
      inherit specialArgs;
      modules = [
        ./kaze
        sopsModule
        hmModule
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = specialArgs;
            users.notoh = {
              imports = homeImports."default";
            };
          };
        }
      ];
    };
  };
}
