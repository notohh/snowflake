_: {
  virtualisation.oci-containers.containers.stash = {
    image = "stashapp/stash:v0.24.2";
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
    ports = [
      "9999:9999"
    ];
  };
}
