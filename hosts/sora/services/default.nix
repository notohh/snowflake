{...}: {
  imports = [
    ./restic.nix
    ./traefik.nix
    ./uptimekuma.nix
    ./ntfy-sh.nix
    ./tailscale.nix
    ./attic.nix
    ./minio.nix
    ./factorio.nix
    # ./minecraft.nix
    # ./foundryvtt.nix
  ];
}
