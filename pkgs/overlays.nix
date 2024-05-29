{lib, ...}: {
  nixpkgs = {
    overlays = [
      (final: prev: {
        spotify-player = prev.spotify-player.overrideAttrs (old: rec {
          pname = "spotify-player";
          version = "0.18.2";
          src = prev.fetchFromGitHub {
            owner = "aome510";
            repo = pname;
            rev = "refs/tags/v${version}";
            hash = "sha256-bLUPQgqSsE9tF5YiFj5B+Ylyy96DhWFNjwqXbQ9H8uc=";
          };
          cargoDeps = old.cargoDeps.overrideAttrs (lib.const {
            name = "spotify-player.tar.gz";
            inherit src;
            outputHash = "sha256-sBhQuU0HpyXOEUtKPZxoNxSp1d5nxuifcYCW7cCOgJI=";
          });
        });
      })
    ];
  };
}
