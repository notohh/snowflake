{
  pkgs,
  rustPlatform,
  fetchFromGitHub,
  lib,
  ...
}:
rustPlatform.buildRustPackage rec {
  pname = "wayscriber";
  version = "v0.7.0";
  src = fetchFromGitHub {
    owner = "devmobasa";
    repo = "wayscriber";
    rev = version;
    sha256 = "sha256-BV87dBnKmPFCwKOBGEH/BS36NFkqXRecxVkBT+7HKDE=";
  };

  nativeBuildInputs = [ pkgs.pkg-config ];
  buildInputs = with pkgs; [
    glib
    pango
    cairo
    libxkbcommon
  ];

  cargoHash = "sha256-a1Bb5Y37RBQJnGnqXNWV54BBAqeLlm5SxKHsODfNHww=";

  meta = with lib; {
    description = ''
      Live overlay for drawing, annotating, hiding text,
      and capturing screenshots on Wayland. Can be used as whiteboard or blackboard.
      Highly customisable.
    '';
    mainProgram = "wayscriber";
    homepage = "https://github.com/devmobasa/wayscriber";
    license = licenses.mit;
    maintainers = with maintainers; [ notohh ];
  };
}
