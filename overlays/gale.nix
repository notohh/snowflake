_: {
  flake.overlays.gale = _final: prev: {
    gale = prev.gale.overrideAttrs (n: _o: let
      version = "1.8.6";
    in {
      src = prev.fetchFromGitHub {
        inherit version;
        owner = "Kesomannen";
        repo = "gale";
        rev = version;
        hash = "sha256-5xUBW9Owyeet8Jyc+7TQr6XQTbkopbJLeyI5c35iqr0=";
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
        hash = "sha256-6yWRl9WAPJoqoXm0kLfZhEf7AYD6J//FlOmDxzeknFo=";
      };
    });
  };
}
