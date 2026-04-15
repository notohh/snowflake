{ pkgs, ... }:
{
  home.packages = [ pkgs.nix-search-tv ];
  programs = {
    nix-search-tv.enableTelevisionIntegration = true;
    television = {
      enable = true;
    };
  };
}
