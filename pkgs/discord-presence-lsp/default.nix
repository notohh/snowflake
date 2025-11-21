{ pkgs }:
pkgs.rustPlatform.buildRustPackage rec {
  pname = "discord-presence-lsp";
  version = "76efde8adf8730fd91ccc1e3af44e0eebcd90d8e";

  src = pkgs.fetchFromGitHub {
    owner = "xhyrom";
    repo = "zed-discord-presence";
    rev = version;
    hash = "sha256-DAejif9ai3So5bCF21Z4NX3ZHXlkYMGpNYanszeDblg=";
  };

  cargoHash = "sha256-1lcnw79UURe7LUuV2q9+CwUzVxG34J6cAxIgORbjLnU=";
  cargoBuildFlags = "--package discord-presence-lsp";
}
