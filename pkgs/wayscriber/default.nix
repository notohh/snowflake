# will be removed for upstream nixpkgs version eventually
{
  pkgs,
  rustPlatform,
  fetchFromGitHub,
  lib,
  ...
}:
rustPlatform.buildRustPackage rec {
  pname = "wayscriber";
  version = "v0.8.7";
  src = fetchFromGitHub {
    owner = "devmobasa";
    repo = "wayscriber";
    rev = version;
    sha256 = "sha256-CJ3UleMFk033zuz507KIhHkVRRayh6Z+OdaREhFs0GM=";
  };

  nativeBuildInputs = [ pkgs.pkg-config ];
  buildInputs = with pkgs; [
    pango
    libxkbcommon
  ];

  cargoHash = "sha256-cLV7NRQGK2jjCBOeTNe86ESV4TG0vTYJu3K5aQHQrXo=";

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
