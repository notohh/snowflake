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
              rev = "f6d0bd19caddb9f8f433877020e64e18923bbc7a";
              hash = "sha256-JTz/w8qtR59LVpuWbmiZDpwF+hepe78iCZ/3gi4O/Vc=";
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
