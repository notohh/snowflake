_: {
  virtualisation.oci-containers.containers.stash = {
    image = "stashapp/stash@sha256:b3b59809d5be1d82467253ec9e2ee98628a0db7527d27a6c7daa75e1fcda7deb"; # v0.24.3
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
      "/home/notoh/docker/stash/.config:/root/.stash"
      "/home/notoh/docker/stash/data:/data"
      "/home/notoh/docker/stash/.metadata:/metadata"
      "/home/notoh/docker/stash/cache:/cache"
      "/home/notoh/docker/stash/generated:/generated"
      "/home/notoh/docker/stash/blobs:/blobs"
    ];
  };
}
