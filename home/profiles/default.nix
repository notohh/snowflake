# stolen from fufexan
{
  inputs,
  self,
  ...
}: let
  extraSpecialArgs = {inherit inputs self;};

  homeImports = {
    "notoh@tsuki" = [
      ../.
      ./tsuki
    ];
    "notoh@ame" = [
      ../.
      ./ame
    ];
    default = [
      ../.
      ./default
    ];
  };

  inherit (inputs.hm.lib) homeManagerConfiguration;

  pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
in {
  _module.args = {inherit homeImports;};

  flake = {
    homeConfigurations = {
      "notoh_tsuki" = homeManagerConfiguration {
        modules = homeImports."notoh@tsuki";
        inherit pkgs extraSpecialArgs;
      };

      "notoh_ame" = homeManagerConfiguration {
        modules = homeImports."notoh@ame";
        inherit pkgs extraSpecialArgs;
      };

      default = homeManagerConfiguration {
        modules = homeImports.default;
        inherit pkgs extraSpecialArgs;
      };
    };
  };
}
