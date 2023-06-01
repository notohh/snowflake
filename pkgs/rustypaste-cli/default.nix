{
  lib,
  rustPlatform,
  fetchFromGitHub,
  ...
}:
rustPlatform.buildRustPackage rec {
  pname = "rustypaste-cli";
  version = "0.4.0";
  src = fetchFromGitHub {
    owner = "orhun";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-Jl7fytDIW6MLY6VX7rDuX9PcZaIqENQbUTMUJKCa8Mg=";
  };

  cargoHash = "sha256-hICwrgzNpyYmNW1gEKgTsSjWyqCaOHc4X37O0R2oSzY=";

  meta = with lib; {
    description = "A CLI tool for rustypaste ";
    homepage = "https://github.com/orhun/rustypaste-cli";
    license = licenses.mit;
    maintainers = with maintainers; [notohh];
  };
}
