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
          homepage = {
            rule = "Host(`dashboard.internal.flake.sh`)";
            entrypoints = ["web"];
            service = "homepage";
          };
          stash = {
            rule = "Host(`stash.internal.flake.sh`)";
            entrypoints = ["web"];
            service = "stash";
          };
          jellyfin = {
            rule = "Host(`jellyfin.internal.flake.sh`)";
            entrypoints = ["web"];
            service = "jellyfin";
          };
          jellyseerr = {
            rule = "Host(`jellyseerr.internal.flake.sh`)";
            entrypoints = ["web"];
            service = "jellyseerr";
          };
          wallos = {
            rule = "Host(`wallos.internal.flake.sh`)";
            entrypoints = ["web"];
            service = "wallos";
          };
        };
        services = {
          stash.loadBalancer.servers = [{url = "http://localhost:9999";}];
          homepage.loadBalancer.servers = [{url = "http://localhost:7676";}];
          jellyfin.loadBalancer.servers = [{url = "http://localhost:8096";}];
          jellyseerr.loadBalancer.servers = [{url = "http://localhost:5055";}];
          wallos.loadBalancer.servers = [{url = "http://localhost:8282";}];
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
