{
  inputs,
  pkgs,
  ...
}: let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.system};
in {
  imports = [inputs.spicetify-nix.homeManagerModules.default];
  programs.spicetify = {
    enable = true;
    experimentalFeatures = true;
    enabledExtensions = with spicePkgs.extensions; [
      hidePodcasts
      beautifulLyrics
      fullAlbumDate
      shuffle
    ];
    theme = spicePkgs.themes.hazy;
  };
}
