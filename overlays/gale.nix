_: {
  flake.overlays.gale = _final: prev: {
    gale = prev.gale.overrideAttrs (n: _o: let
      version = "1.9.2";
    in {
      src = prev.fetchFromGitHub {
        inherit version;
        owner = "Kesomannen";
        repo = "gale";
        rev = version;
        hash = "sha256-AADU89Nxy7dpmamRdvCSe5ItwoVsRvgQocoMKs7qUZo=";
      };
      pnpmDeps = prev.pnpm_10.fetchDeps {
        hash = "sha256-QQXP/x7AjDtUpe6h+pC6vUsIAptv1kN/1MJZjHAIdMo=";
        fetcherVersion = 1;
        inherit (n) pname version src;
      };
      cargoDeps = prev.rustPlatform.fetchCargoVendor {
        inherit
          (n)
          pname
          version
          src
          cargoRoot
          ;
        hash = "sha256-+eSEOcmrY+3LpOssJzXHFQYKkvdacl5K6FPfcf7LTUQ=";
      };
    });
  };
}
