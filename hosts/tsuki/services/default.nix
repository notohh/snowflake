{ ... }:
{
  imports = [
    ./restic.nix
    ./atticd.nix
    ./immich-backup.nix
    ./syncthing.nix
    ./twitch-miner.nix
    ./owncast.nix
  ];
}
