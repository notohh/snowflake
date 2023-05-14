{config, ...}: {
  virtualisation.oci-containers.containers.foundryvtt = {
    image = "felddy/foundryvtt:release";
    ports = ["30000:30000"];
    volumes = [
      "/home/notoh/docker/foundryvtt:/data"
    ];
    environmentFiles = [
      /run/secrets/foundry-username
      /run/secrets/foundry-password
    ];
  };
}
