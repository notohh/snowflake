_: {
  imports = [
    ./restic.nix
    ./traefik.nix
    ./uptimekuma.nix
    ./ntfy-sh.nix
    ./attic.nix
    ./tailscale.nix
    ./croc.nix
    ./mumble.nix

    ### game servers
    # ./terraria.nix
    # ./factorio.nix
    # ./minecraft.nix
    # ./foundryvtt.nix
    # ./quakelive.nix
  ];
}
