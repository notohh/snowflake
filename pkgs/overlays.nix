{lib, ...}: {
  nixpkgs = {
    overlays = [
      (self: super: {
        technorino =
          super.chatterino2.overrideAttrs
          (oldAttrs: {
            nativeBuildInputs = with super; [cmake pkg-config];
            buildInputs = with super; [qt6.wrapQtAppsHook qt6.qtbase qt6.qtsvg qt6.qtimageformats qt6.qttools qt6.qt5compat qt6.qtwayland boost openssl];
            cmakeFlags = ["-DBUILD_WITH_QT6=ON" "-DBUILD_WITH_QTKEYCHAIN=OFF"];
            src = super.chatterino2.src.override {
              owner = "2547techno";
              repo = "technorino";
              rev = "nightly-build";
              sha256 = "sha256-PY+K1l29wwG8ddqTxOwkbKb8CQoOBwbOeCgn0VTDptM=";
            };
          });
      })
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
