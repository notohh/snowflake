_: {
  sops.secrets.foundry-username = { };
  sops.secrets.foundry-password = { };
  virtualisation.oci-containers.containers.foundryvtt = {
    image = "felddy/foundryvtt@sha256:d85dab9704d771f3a33f21439f1bf34748fb5bf1987668ff402b5b17d1973f5a";
    volumes = [ "/home/notoh/docker/foundryvtt:/data" ];
    environment = {
      CONTAINER_PRESERVE_CONFIG = "true";
    };
    environmentFiles = [
      /run/secrets/foundry-username
      /run/secrets/foundry-password
    ];
    ports = [ "30000:30000" ];
  };
}
