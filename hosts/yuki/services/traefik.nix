_: {
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
          kanboard = {
            rule = "Host(`kanboard.home.arpa`)";
            entryPoints = ["web"];
            service = "kanboard";
          };
        };
        services = {
          kanboard.loadBalancer.servers = [{url = "http://localhost:8080";}];
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
        websecure.address = ":443";
        web.address = ":80";
      };
    };
  };
}
