{
  inputs,
  homeImports,
  ...
}: {
  flake.nixosConfigurations = let
    inherit (inputs.nixpkgs.lib) nixosSystem;
    specialArgs = {inherit inputs;};
  in {
    tsuki = nixosSystem {
      inherit specialArgs;
      modules = [
        ./tsuki
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
    ame = nixosSystem {
      inherit specialArgs;
      modules = [
        ./ame
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
    sakura = nixosSystem {
      inherit specialArgs;
      modules = [
        ./sakura
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
    arashi = nixosSystem {
      inherit specialArgs;
      modules = [
        ./arashi
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
