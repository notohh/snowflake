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
    rev = "fa2181af70b5efa0376a5f6ffa937073b2201339";
    sha256 = "sha256-E77mzceKBaXOjW/C/aHfUltt1Wb7RAzvJzhlgmbxkoE=";
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
