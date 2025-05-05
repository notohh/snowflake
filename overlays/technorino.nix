_: {
  flake.overlays.technorino = final: prev: {
    technorino =
      prev.chatterino2.overrideAttrs
      (old: {
        nativeBuildInputs = with prev; [cmake pkg-config];
        buildInputs = with prev; [qt6.wrapQtAppsHook qt6.qtbase qt6.qtsvg qt6.qtimageformats qt6.qttools qt6.qt5compat qt6.qtwayland boost openssl libnotify];
        cmakeFlags = ["-DBUILD_WITH_QT6=ON" "-DBUILD_WITH_QTKEYCHAIN=OFF"];
        src = prev.chatterino2.src.override {
          owner = "2547techno";
          repo = "technorino";
          rev = "92c4d27e19a19ebc0621946f09d04759bd141b8f";
          tag = null;
          hash = "sha256-jaO0kacV2Xd3AWF3ZKbp0feS+UQVLe+rVHrU+yjQ4q0=";
        };
      });
  };
}
