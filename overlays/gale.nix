_: {
  flake.overlays.gale = prev: {
    gale = prev.gale.overrideAttrs (n: let
      version = "1.8.3";
    in {
      src = prev.fetchFromGitHub {
        inherit version;
        owner = "Kesomannen";
        repo = "gale";
        rev = "1.8.3";
        hash = "sha256-tCtWPr5f37J+VfdpwIi6YoNaKS4LjBE9eLFuCuWBkPc=";
      };
      npmDeps = prev.fetchNpmDeps {
        hash = "sha256-vR66MdNbUzqklivSNqoklQ0CCdH1VfHcgiI+Y7MOkvA=";
        name = "${n.pname}-${n.version}-npm-deps";
        inherit (n) src;
      };
      cargoDeps = prev.rustPlatform.fetchCargoVendor {
        inherit
          (n)
          pname
          version
          src
          cargoRoot
          ;
        hash = "sha256-oAEzL4lEqF5lWVsnnDpOgGTtcQDUI0nuur72Gl49EGk=";
      };
    });
  };
}
