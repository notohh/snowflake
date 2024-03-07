{lib, ...}: {
  nixpkgs = {
    overlays = [
      (final: prev: {
        obsidian-wayland = prev.obsidian.override {electron = final.electron_24;};
      })
      (final: prev: {
        spotify-player = prev.spotify-player.overrideAttrs (old: rec {
          pname = "spotify-player";
          version = "0.17.0";
          src = prev.fetchFromGitHub {
            owner = "aome510";
            repo = pname;
            rev = "refs/tags/v${version}";
            hash = "sha256-fGDIlkTaRg+J6YcP9iBcJFuYm9F0UOA+v/26hhdg9/o=";
          };
          cargoDeps = old.cargoDeps.overrideAttrs (lib.const {
            name = "spotify-player.tar.gz";
            inherit src;
            outputHash = "sha256-6AdIU4Q5nxsZW9cRoRI/Zn7EQ3ZJ/EYSFfXIeatT8sY=";
          });
        });
      })
    ];
  };
}
