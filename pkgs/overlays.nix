{lib, ...}: {
  nixpkgs = {
    overlays = [
      (self: super: {
        technorino =
          super.chatterino2.overrideAttrs
          (old: {
            nativeBuildInputs = with super; [cmake pkg-config];
            buildInputs = with super; [qt6.wrapQtAppsHook qt6.qtbase qt6.qtsvg qt6.qtimageformats qt6.qttools qt6.qt5compat qt6.qtwayland boost openssl];
            cmakeFlags = ["-DBUILD_WITH_QT6=ON" "-DBUILD_WITH_QTKEYCHAIN=OFF"];
            src = super.chatterino2.src.override {
              owner = "2547techno";
              repo = "technorino";
              rev = "4e7dec4932e36752b4f76dc6e3caf8b41a9a9e04";
              tag = null;
              hash = "sha256-WnOFLzgQTW6f6qf2/7r+0U18GDJ48Y93BivIEvKqbYk=";
            };
          });
      })
      (final: prev: {
        spotify-player = prev.spotify-player.overrideAttrs (old: rec {
          pname = "spotify-player";
          version = "0.19.1";
          src = prev.fetchFromGitHub {
            owner = "aome510";
            repo = pname;
            rev = "refs/tags/v${version}";
            hash = "sha256-R8F7s8FPnCe+shNUN/u0qcxFy3IbyfVo2xZ5/E/qwaw=";
          };
          cargoDeps = old.cargoDeps.overrideAttrs (lib.const {
            name = "spotify-player.tar.gz";
            inherit src;
            outputHash = "sha256-t9sLyz65aI6lngXlDBORWxiFNg5Pz3k0C9vBwg4chfo=";
          });
        });
      })
    ];
  };
}
