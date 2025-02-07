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
              rev = "adcae44397f95d8d50cd59c3d52bc76af7e6b305";
              tag = null;
              hash = "sha256-gm1lR3NY8JK3VGmEbgt/VCtl81PNvRPWViFsKr9C2fM=";
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
      (final: prev: {
        vesktop = prev.vesktop.overrideAttrs (finalAttrs: oldAttrs: rec {
          pname = "Vesktop";
          version = "1.5.5";
          src = prev.fetchFromGitHub {
            owner = "Vencord";
            repo = pname;
            rev = "refs/tags/v${version}";
            hash = "sha256-z2MKnCWDWUczoz39zzBYRB6wiSU1SRRHLpeUZeJqbLc=";
          };
          pnpmDeps = prev.pnpm_9.fetchDeps {
            inherit
              (finalAttrs)
              pname
              version
              src
              patches
              ;
            hash = "sha256-xn3yE2S6hfCijV+Edx3PYgGro8eF76/GqarOIRj9Tbg=";
          };
        });
      })
    ];
  };
}
