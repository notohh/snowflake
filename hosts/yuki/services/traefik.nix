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
          kanboard = {
            rule = "Host(`kanboard.home.arpa`)";
            entryPoints = ["web"];
            service = "kanboard";
          };
          stash = {
            rule = "Host(`stash.home.arpa`)";
            entrypoints = ["web"];
            service = "stash";
          };
          homarr = {
            rule = "Host(`dashboard.home.arpa`)";
            entrypoints = ["web"];
            service = "homarr";
          };
          dashdot = {
            rule = "Host(`dashdot.yuki.home.arpa`)";
            entrypoints = ["web"];
            service = "dashdot";
          };
        };
        services = {
          kanboard.loadBalancer.servers = [{url = "http://localhost:8080";}];
          stash.loadBalancer.servers = [{url = "http://localhost:9999";}];
          homarr.loadBalancer.servers = [{url = "http://localhost:7575";}];
          dashdot.loadBalancer.servers = [{url = "http://localhost:4000";}];
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
