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
          rev = "8dff24df72dce406c31afafacf2103d3263093f0";
          tag = null;
          hash = "sha256-eMstzHM27PCAjoeZwB8sO5ko8HmpTKi7UyupdQwAeSo=";
        };
      });
  };
}
