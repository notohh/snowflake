_: {
  networking.firewall.allowedTCPPorts = [80 443];
  services.traefik = {
    enable = true;
    dynamicConfigOptions = {
      http = {
        routers = {
          api = {
            rule = "PathPrefix(`/api/`)";
            entryPoints = ["websecure"];
            service = "api@internal";
          };
        };
        services = {
          sonarr.loadBalancer.servers = [{url = "http://localhost:8989";}];
        };
      };
    };
    staticConfigOptions = {
      log.level = "DEBUG";
      api.dashboard = false;
      api.insecure = false;
      global = {
        checkNewVersion = false;
        sendAnonymousUsage = false;
      };
      entryPoints = {
        websecure = {
          address = ":443";
          forwardedHeaders.insecure = true;
        };
        web = {
          address = ":80";
          forwardedHeaders.insecure = true;
        };
      };
    };
  };
}
