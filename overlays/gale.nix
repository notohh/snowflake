_: {
  flake.overlays.gale = _final: prev: {
    gale = prev.gale.overrideAttrs (n: _o: let
      version = "1.9.5";
    in {
      src = prev.fetchFromGitHub {
        inherit version;
        owner = "Kesomannen";
        repo = "gale";
        rev = version;
        hash = "sha256-LdMuAQ7eTPiEZRxxjGdycrI53JwJQ3grK5QORPhfo50=";
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
        hash = "sha256-0wWU9Tf5NlYXrflIDghEwyjeR8j96CK0TATU1tWO418=";
      };
    });
  };
}
