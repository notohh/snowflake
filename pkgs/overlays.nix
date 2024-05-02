{lib, ...}: {
  nixpkgs = {
    overlays = [
      (final: prev: {
        obsidian-wayland = prev.obsidian.override {electron = final.electron_24;};
      })
      (final: prev: {
        spotify-player = prev.spotify-player.overrideAttrs (old: rec {
          pname = "spotify-player";
          version = "0.18.1";
          src = prev.fetchFromGitHub {
            owner = "aome510";
            repo = pname;
            rev = "refs/tags/v${version}";
            hash = "sha256-3nPESnBWaxWjWMvRG7gbXt8FzuPlx2soOonCKom+tzA=";
          };
          cargoDeps = old.cargoDeps.overrideAttrs (lib.const {
            name = "spotify-player.tar.gz";
            inherit src;
            outputHash = "sha256-fzFWSPRPWYSiBzbW7OWODahckuzFahdt09V5WKC3Pmo=";
          });
        });
      })
    ];
  };
}
