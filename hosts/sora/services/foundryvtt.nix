_: {
  sops.secrets.foundry-username = { };
  sops.secrets.foundry-password = { };
  virtualisation.oci-containers.containers.foundryvtt = {
    image = "felddy/foundryvtt@sha256:be4927bcf119eefea33a7acc4a60bdc8ee5ae32a35e72912e8d8c2d0f06bd1c7";
    volumes = [ "/var/lib/foundryvtt:/data:rw" ];
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
