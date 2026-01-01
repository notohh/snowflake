{ pkgs, ... }:
let
  storagePath = "/var/lib/stash";
in
{
  environment.systemPackages = [ pkgs.gallery-dl ];
  virtualisation.oci-containers.containers.stash = {
    image = "stashapp/stash@sha256:4cac18873ea052f03510602d9e1a9b29e6241a393a111479010292b7a1e28a5e"; # v0.30.1
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
