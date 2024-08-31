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
    rev = "232aab4775c35a5d79ce38aa81a6724007aa0b59";
    hash = "sha256-gwBQu1xf4rmDbOzvxXzQsHJr4faOECmRwyT7MR+pPyI=";
  };

  cargoHash = "sha256-hwF3qSlv/wZhJh1kIxm/U0ZpnAZpiMzUe0OncGBlclk=";

  doCheck = false;

  meta = {
    description = "Language server to enable word completion and snippets for Helix editor";
    homepage = "https://github.com/estin/simple-completion-language-server";
    mainProgram = "simple-completion-language-server";
  };
}
