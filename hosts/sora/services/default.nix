{...}: {
  imports = [
    ./traefik.nix
    ./uptimekuma.nix
    ./ntfy-sh.nix
    ./tailscale.nix
    ./restic.nix
    ./factorio.nix
    # ./minecraft.nix
    # ./foundryvtt.nix
  ];
}
