{
  pkgs,
  lib,
  rustPlatform,
  fetchFromGitea,
  ...
}:
rustPlatform.buildRustPackage {
  name = "forex";
  src = fetchFromGitea {
    domain = "git.flake.sh";
    owner = "notohh";
    repo = "forex";
    rev = "de4b32b0d5bf0631404dd11c5878058bc7fd4a56";
    sha256 = "sha256-d/iyg/tFF3N0I6LCSFU4U1vBzpz60s2FnT0GB4AuihE=";
  };

  nativeBuildInputs = [pkgs.pkg-config];
  buildInputs = [pkgs.openssl];

  cargoSha256 = "sha256-COWFG766DVWXbGm8raVSH1nBpsS5HdTat5BHzv7QR4o=";

  meta = with lib; {
    description = "a CLI currency converter, written in rust, for practice";
    mainProgram = "forex";
    homepage = "https://git.flake.sh/notohh/forex";
    license = licenses.mit;
    maintainers = with maintainers; [notohh];
  };
}
