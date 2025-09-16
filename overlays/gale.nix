_: {
  flake.overlays.gale = _: prev: {
    gale = prev.gale.overrideAttrs (
      n: _:
      let
        version = "1.9.7";
      in
      {
        src = prev.fetchFromGitHub {
          inherit version;
          owner = "Kesomannen";
          repo = "gale";
          rev = version;
          hash = "sha256-XEc8h7A1q+WfPl2HojFt2oIlAnNswq3X0o6jMZrEjCQ=";
        };
        pnpmDeps = prev.pnpm_10.fetchDeps {
          hash = "sha256-QQXP/x7AjDtUpe6h+pC6vUsIAptv1kN/1MJZjHAIdMo=";
          fetcherVersion = 1;
          inherit (n) pname version src;
        };
        cargoDeps = prev.rustPlatform.fetchCargoVendor {
          inherit (n)
            pname
            version
            src
            cargoRoot
            ;
          hash = "sha256-zaTbb1+JK9mA9Tvnatw8lse5PBhKknDM48mN/sWLQ6w=";
        };
      }
    );
  };
}
