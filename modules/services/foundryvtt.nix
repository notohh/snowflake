{...}: {
  sops.secrets.foundry-username = {};
  sops.secrets.foundry-password = {};
  virtualisation.oci-containers.containers.foundryvtt = {
    image = "felddy/foundryvtt:release";
    volumes = [
      "/home/notoh/docker/foundryvtt:/data"
    ];
    environmentFiles = [
      /run/secrets/foundry-username
      /run/secrets/foundry-password
    ];
    ports = [
      "30000:30000"
    ];
  };
}
