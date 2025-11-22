{ inputs, ... }:
{
  imports = [ inputs.flake-parts.flakeModules.easyOverlay ];

  perSystem =
    { config, pkgs, ... }:
    {
      overlayAttrs = {
        inherit (config.packages)
          wayscriber
          discord-presence-lsp
          ;
      };

      packages = {
        wayscriber = pkgs.callPackage ./wayscriber { };
        discord-presence-lsp = pkgs.callPackage ./discord-presence-lsp { };
      };
    };
}
