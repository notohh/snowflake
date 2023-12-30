_: {
  sops.secrets.foundry-username = {};
  sops.secrets.foundry-password = {};
  virtualisation.oci-containers.containers.foundryvtt = {
    image = "felddy/foundryvtt:v11.308.0";
    volumes = [
      "/home/notoh/docker/foundryvtt:/data"
    ];
    environment = {
      CONTAINER_PRESERVE_CONFIG = "true";
    };
    environmentFiles = [
      /run/secrets/foundry-username
      /run/secrets/foundry-password
    ];
    ports = [
      "30000:30000"
    ];
  };
}
