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
  version = "v0.9.11";
  src = fetchFromGitHub {
    owner = "devmobasa";
    repo = "wayscriber";
    rev = version;
    sha256 = "sha256-HoIa1uVk5Z+kmDxpFJl3Yjek1BVJvWrSdA4L3rJEv6o=";
  };

  nativeBuildInputs = [ pkgs.pkg-config ];
  buildInputs = with pkgs; [
    pango
    libxkbcommon
  ];

  cargoHash = "sha256-vpJeFO363fFyoHcF0JYru4nhC5um2jmZscdTC/S/egQ=";

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
