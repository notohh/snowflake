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
    theme = {
      name = "Blackout";
      src = "${pkgs.fetchFromGitHub {
        owner = "spicetify";
        repo = "spicetify-themes";
        rev = "726097a544172523cdae15da8d3c84032aec8c3b";
        sha256 = "sha256-mQgkmbkgzfWlT1iv4jB/cw95v4q0/+57B9rgmezAY34=";
      }}/Blackout";
    };
    colorScheme = "def";
    enabledExtensions = with spicePkgs.extensions; [
      beautifulLyrics
      shuffle
      fullAlbumDate
      showQueueDuration
      history
      hidePodcasts
      playNext
      volumePercentage
      lastfm
    ];
  };
}
