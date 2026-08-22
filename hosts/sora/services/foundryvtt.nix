_: {
  sops.secrets.foundry-username = { };
  sops.secrets.foundry-password = { };
  virtualisation.oci-containers.containers.foundryvtt = {
    image = "felddy/foundryvtt@sha256:097f876d9c79f074380e219bf93753fa1916f31624637776fcf23c2dd3bb07fa"; # 14.364
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
