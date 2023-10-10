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
          homarr = {
            rule = "Host(`dashboard.internal.flake.sh`)";
            entrypoints = ["web"];
            service = "homarr";
          };
          stash = {
            rule = "Host(`stash.internal.flake.sh`)";
            entrypoints = ["web"];
            service = "stash";
          };
          dashdot = {
            rule = "Host(`dashdot.yuki.internal.flake.sh`)";
            entrypoints = ["web"];
            service = "dashdot";
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
        };
        services = {
          stash.loadBalancer.servers = [{url = "http://localhost:9999";}];
          homarr.loadBalancer.servers = [{url = "http://localhost:7575";}];
          dashdot.loadBalancer.servers = [{url = "http://localhost:4000";}];
          jellyfin.loadBalancer.servers = [{url = "http://localhost:8096";}];
          jellyseerr.loadBalancer.servers = [{url = "http://localhost:5055";}];
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
