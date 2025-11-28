{ inputs, ... }:
{
  imports = [ inputs.flake-parts.flakeModules.easyOverlay ];

  perSystem =
    { config, pkgs, ... }:
    {
      overlayAttrs = {
        inherit (config.packages)
          wayscriber
          ;
      };

      packages = {
        wayscriber = pkgs.callPackage ./wayscriber { };
      };
    };
}
