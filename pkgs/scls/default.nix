{
  fetchFromGitHub,
  rustPlatform,
}:
rustPlatform.buildRustPackage {
  pname = "simple-completion-language-server";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "estin";
    repo = "simple-completion-language-server";
    rev = "3edd6209fffd204d689fb3b0afb0e51ad90f0af2";
    hash = "sha256-iccwhZhwYLxjhCLj8kRLqlL1F9TjZ57BogqlbKgCsKM=";
  };

  cargoHash = "sha256-nxLnlBfqcA64npPccuE00JxCLGi4eU9nWyU0PSVdKpE=";

  doCheck = false;

  meta = {
    description = "Language server to enable word completion and snippets for Helix editor";
    homepage = "https://github.com/estin/simple-completion-language-server";
    mainProgram = "simple-completion-language-server";
  };
}
