{...}: {
  networking.firewall.allowedTCPPorts = [80 443];

  services.traefik = {
    enable = true;
    group = "docker";
    dynamicConfigOptions = {
      http = {
        routers = {
          homepage = {
            rule = "Host(`dashboard.lab`)";
            entryPoints = ["websecure"];
            service = "homepage";
          };
        };
      };
    };
    staticConfigOptions = {
      global = {
        checkNewVersion = false;
        sendAnonymousUsage = false;
      };
      entryPoints = {
        websecure.address = ":443";
        web.address = ":80";
      };
    };
  };
}
