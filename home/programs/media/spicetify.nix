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
    wayland = true;
    colorScheme = "mocha";
    enabledExtensions = with spicePkgs.extensions; [
      beautifulLyrics
      hidePodcasts
      fullAlbumDate
      shuffle
    ];
    theme = spicePkgs.themes.catppuccin;
  };
}
