{
  lib,
  fetchFromGitHub,
  rustPlatform,
}:
rustPlatform.buildRustPackage rec {
  pname = "jellyfin-rpc";
  version = "0.14.6";

  src = fetchFromGitHub {
    owner = "Radiicall";
    repo = "jellyfin-rpc";
    rev = "04b412fb08268e9ee9e0aebfb72ea06e7284275a";
    sha256 = "sha256-EcydqJoeLEfY40UHermU8jw7PHAAii8YQR/m4q9S1vo=";
  };
  cargoHash = "sha256-C+ZWYNW9tWol8n5y2q+qx0ava8fn3hqEzCxIEtCJDTw=";

  meta = with lib; {
    description = "Displays the content you're currently watching on Discord!";
    homepage = "https://github.com/Radiicall/jellyfin-rpc";
    license = licenses.gpl3;
    maintainers = with maintainers; [notohh];
  };
}
