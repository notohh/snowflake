{ pkgs, ... }:
let
  storagePath = "/var/lib/stash";
in
{
  environment.systemPackages = [ pkgs.gallery-dl ];
  virtualisation.oci-containers.containers.stash = {
    image = "stashapp/stash@sha256:df744af5a0c976e2ec671052ecc1f8a9aa757fa12b8f9930b59910b7295f0da6"; # v0.31.1
    ports = [ "9999:9999" ];
    environment = {
      STASH_STASH = "/data/";
      STASH_GENERATED = "/generated/";
      STASH_METADATA = "/metadata/";
      STASH_CACHE = "/cache/";
      STASH_PORT = "9999";
    };
    volumes = [
      "/etc/localtime:/etc/localtime:ro"
      "/stash-media:/data"
      "${storagePath}/.config:/root/.stash"
      "${storagePath}/.metadata:/metadata"
      "${storagePath}/cache:/cache"
      "${storagePath}/generated:/generated"
      "${storagePath}/blobs:/blobs"
    ];
  };
}
