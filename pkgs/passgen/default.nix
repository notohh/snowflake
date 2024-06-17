{
  rustPlatform,
  fetchFromGitea,
  lib,
  ...
}:
rustPlatform.buildRustPackage {
  name = "passgen";
  src = fetchFromGitea {
    domain = "git.flake.sh";
    owner = "notohh";
    repo = "passgen";
    rev = "4a01bd5faae893682e7011632bdda8f12c96ef49";
    sha256 = "sha256-+a1B1Z/N7OsGTVmIBp/JJZYdvTerClHo7y1Bn419dlg=";
  };

  cargoSha256 = "sha256-A8W7Qz+8cy6sPjLBC5a4Brz+cCyGPeNM1f7oZ6pmfe0=";

  meta = with lib; {
    description = "password generator for rust practice";
    mainProgram = "passgen";
    homepage = "https://git.flake.sh/notohh/passgen";
    license = licenses.mit;
    maintainers = with maintainers; [notohh];
  };
}
