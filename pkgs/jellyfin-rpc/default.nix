{
  lib,
  fetchFromGitHub,
  rustPlatform,
}:
rustPlatform.buildRustPackage rec {
  pname = "jellyfin-rpc";
  version = "0.15.5";

  src = fetchFromGitHub {
    owner = "Radiicall";
    repo = "jellyfin-rpc";
    rev = "fcb13733e049153a111d8d4116324c3b02be9530";
    sha256 = "sha256-LQFXG5P4V2M6TVPyvCl2XMM70K61Z1sCyyLc05Twl4M=";
  };
  cargoHash = "sha256-uswD0PAoJ6x6bu7766QPdWB0CnINBaRAlkeEdNrC9xw=";

  meta = with lib; {
    description = "Displays the content you're currently watching on Discord!";
    homepage = "https://github.com/Radiicall/jellyfin-rpc";
    license = licenses.gpl3;
    maintainers = with maintainers; [notohh];
  };
}
