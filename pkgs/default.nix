{ inputs, ... }:
{
  imports = [ inputs.flake-parts.flakeModules.easyOverlay ];

  perSystem =
    { config, pkgs, ... }:
    {
      overlayAttrs = {
        inherit (config.packages)
          wayscriber
          curseforge
          ;
      };

      packages = {
        wayscriber = pkgs.callPackage ./wayscriber { };
        curseforge = pkgs.callPackage ./curseforge { };
      };
    };
}
