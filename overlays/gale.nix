_: {
  flake.overlays.gale = _: prev: {
    gale = prev.gale.overrideAttrs (
      n: _:
      let
        version = "1.10.0";
      in
      {
        src = prev.fetchFromGitHub {
          inherit version;
          owner = "Kesomannen";
          repo = "gale";
          rev = version;
          hash = "sha256-SnPYuMYdoY69CWMztuDxw0ohRDU2uECNhBs46hLg+eA=";
        };
        pnpmDeps = prev.pnpm_10.fetchDeps {
          hash = "sha256-DYhPe59qfsSjyMIN31RL0mrHfmE6/I1SF+XutettkO8=";
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
          hash = "sha256-tWQRYD6hMU7cvtelGryLdpfoEnUKYt7yYNwHTFZ4pLw=";
        };
      }
    );
  };
}
