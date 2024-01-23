{lib, ...}: {
  nixpkgs = {
    overlays = [
      (final: prev: {
        obsidian-wayland = prev.obsidian.override {electron = final.electron_24;};
      })
      (final: prev: {
        spotify-player = prev.spotify-player.overrideAttrs (old: rec {
          pname = "spotify-player";
          version = "0.16.3";
          src = prev.fetchFromGitHub {
            owner = "aome510";
            repo = pname;
            rev = "refs/tags/v${version}";
            hash = "sha256-8naLLHAVGB8ow88XjU3BpnNzY3SFC2F5uYin67hMc0E=";
          };
          cargoDeps = old.cargoDeps.overrideAttrs (lib.const {
            name = "spotify-player.tar.gz";
            inherit src;
            outputHash = "sha256-KiqQH356tOEz+Hjhh5XZa3/R+Jw/dH9Ys4KPyZZSTec=";
          });
        });
      })
    ];
  };
}
