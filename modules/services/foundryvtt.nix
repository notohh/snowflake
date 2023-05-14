{inputs, ...}: {
  virtualisation.oci-containers.containers.foundryvtt = {
    image = "felddy/foundryvtt:release";
    ports = ["30000:30000"];
    volumes = [
      "/home/notoh/docker/foundryvtt:/data"
    ];
    environment = {
      FOUNDRY_USERNAME = inputs.sops.secrets.foundry-username;
      FOUNDRY_PASSWORD = inputs.sops.secrets.foundry-password;
    };
  };
}
