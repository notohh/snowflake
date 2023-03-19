{
  default,
  ...
}: {
  imports = [
    ./tailscale.nix
    ./security.nix
    ./udevd.nix
  ];
}
