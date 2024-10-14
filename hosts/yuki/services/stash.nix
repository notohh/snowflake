_: let
  storagePath = "/home/notoh/docker/stash";
in {
  virtualisation.oci-containers.containers.stash = {
    image = "stashapp/stash@sha256:b2bfd8ddf706a69ea788e3ca9e6121cb35b9adb8a24c38fa9183cdeb8234c7da"; # v0.27.1
    ports = ["9999:9999"];
    environment = {
      STASH_STASH = "/data/";
      STASH_GENERATED = "/generated/";
      STASH_METADATA = "/metadata/";
      STASH_CACHE = "/cache/";
      STASH_PORT = "9999";
    };
    volumes = [
      "/etc/localtime:/etc/localtime:ro"
      "${storagePath}/.config:/root/.stash"
      "${storagePath}/data:/data"
      "${storagePath}/.metadata:/metadata"
      "${storagePath}/cache:/cache"
      "${storagePath}/generated:/generated"
      "${storagePath}/blobs:/blobs"
    ];
  };
}
