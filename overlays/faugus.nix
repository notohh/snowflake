_: {
  flake.overlays.faugus-launcher = _: prev: {
    faugus-launcher = prev.faugus-launcher.overrideAttrs (
      let
        version = "2.4.4";
      in
      {
        src = prev.fetchFromGitHub {
          inherit version;
          owner = "Faugus";
          repo = "faugus-launcher";
          rev = version;
          hash = "sha256-zyYNBMxm1VC46OWHHgu7ef+uJsZSjNZ42zFnfeLrFvA=";
        };
      }
    );
  };
}
