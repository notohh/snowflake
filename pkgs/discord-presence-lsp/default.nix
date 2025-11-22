{
  rustPlatform,
  fetchFromGitHub,
  lib,
  ...
}:
rustPlatform.buildRustPackage rec {
  pname = "discord-presence-lsp";
  version = "v0.9.0";
  src = fetchFromGitHub {
    owner = "xhyrom";
    repo = "zed-discord-presence";
    rev = version;
    hash = "sha256-jqsXGNhvkQgGYHlv39zVZpQhSU5BUxHxl07x/yv7tzU=";
  };

  cargoHash = "sha256-1lcnw79UURe7LUuV2q9+CwUzVxG34J6cAxIgORbjLnU=";
  cargoBuildFlags = "--package discord-presence-lsp";

  meta = with lib; {
    description = ''
      extension for zed that adds support for discord rich presence using lsp
    '';
    mainProgram = "discord-presence-lsp";
    homepage = "https://github.com/xhyrom/zed-discord-presence";
    license = licenses.gpl3;
    maintainers = with maintainers; [ notohh ];
  };
}
