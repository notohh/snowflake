{
  pkgs,
  rustPlatform,
  fetchFromGitHub,
  lib,
  ...
}:
rustPlatform.buildRustPackage {
  name = "cpm";
  src = fetchFromGitHub {
    owner = "2547techno";
    repo = "cpm";
    rev = "bc7a70a606ea83300aed8d100df2985de785aa83";
    sha256 = "sha256-uk2ltAPx8HxmVUhIIzAcQ6s4cTmsFmPOq0h/kSHMUzw=";
  };

  nativeBuildInputs = [pkgs.pkg-config];
  buildInputs = [pkgs.openssl];

  cargoHash = "sha256-j3FtsrxAvPX2UhMjtLXyWsmLEEn/ZQ6R9nH6PSG844c=";

  meta = with lib; {
    description = "Chatterino Plugin Manager ";
    mainProgram = "cpm";
    homepage = "https://github.com/2547techno/cpm";
    license = licenses.gpl3;
    maintainers = with maintainers; [notohh];
  };
}
