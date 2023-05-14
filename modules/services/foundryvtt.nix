{...}: {
  virtualisation.oci-containers.containers.foundryvtt = {
    image = "felddy/foundryvtt:release";
    ports = ["30000:30000"];
    volumes = [
      "/home/notoh/docker/foundryvtt:/data"
    ];
    environment = {
      FOUNDRY_USERNAME = "";
      FOUNDRY_PASSWORD = "";
    };
  };
}
