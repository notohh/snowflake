_: {
  flake.overlays.technorino = final: prev: {
    technorino =
      prev.chatterino2.overrideAttrs
      (old: {
        nativeBuildInputs = with prev; [cmake pkg-config];
        buildInputs = with prev; [qt6.wrapQtAppsHook qt6.qtbase qt6.qtsvg qt6.qtimageformats qt6.qttools qt6.qt5compat qt6.qtwayland boost openssl];
        cmakeFlags = ["-DBUILD_WITH_QT6=ON" "-DBUILD_WITH_QTKEYCHAIN=OFF"];
        src = prev.chatterino2.src.override {
          owner = "2547techno";
          repo = "technorino";
          rev = "24fa230d7f4c726ee2b731b8d79379eb0d220b4e";
          tag = null;
          hash = "sha256-X74Tg2muO3Wtfc5nH4QvJdOMBVK1uacU+QZMo/5Lf6E=";
        };
      });
  };
}
