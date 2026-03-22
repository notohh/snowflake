{
  inputs,
  homeImports,
  ...
}:
{
  imports = [ ./deploy.nix ];
  flake.nixosConfigurations =
    let
      inherit (inputs.nixpkgs.lib) nixosSystem;
      specialArgs = { inherit inputs; };
      hmOpts = {
        useGlobalPkgs = true;
        useUserPackages = true;
        extraSpecialArgs = specialArgs;
      };
    in
    {
      tsuki = nixosSystem {
        inherit specialArgs;
        modules = [
          ./tsuki
          {
            home-manager = hmOpts // {
              users.notoh.imports = homeImports."notoh@tsuki";
            };
          }
        ];
      };
      ame = nixosSystem {
        inherit specialArgs;
        modules = [
          ./ame
          {
            home-manager = hmOpts // {
              users.notoh.imports = homeImports."notoh@ame";
            };
          }
        ];
      };
      sakura = nixosSystem {
        inherit specialArgs;
        modules = [
          ./sakura
          {
            home-manager = hmOpts // {
              users.notoh.imports = homeImports."default";
            };
          }
        ];
      };
      kariru = nixosSystem {
        inherit specialArgs;
        modules = [
          ./kariru
          {
            home-manager = hmOpts // {
              users.notoh.imports = homeImports."default";
            };
          }
        ];
      };
      yuki = nixosSystem {
        inherit specialArgs;
        modules = [
          ./yuki
          {
            home-manager = hmOpts // {
              users.notoh.imports = homeImports."default";
            };
          }
        ];
      };
      arashi = nixosSystem {
        inherit specialArgs;
        modules = [
          ./arashi
          {
            home-manager = hmOpts // {
              users.notoh.imports = homeImports."default";
            };
          }
        ];
      };
      sora = nixosSystem {
        inherit specialArgs;
        modules = [
          ./sora
          {
            home-manager = hmOpts // {
              users.notoh.imports = homeImports."default";
            };
          }
        ];
      };
      tsuru = nixosSystem {
        inherit specialArgs;
        modules = [
          ./tsuru
          {
            home-manager = hmOpts // {
              users.notoh.imports = homeImports."default";
            };
          }
        ];
      };
      haru = nixosSystem {
        inherit specialArgs;
        modules = [
          ./haru
          {
            home-manager = hmOpts // {
              users.notoh.imports = homeImports."default";
            };
          }
        ];
      };
    };
}
