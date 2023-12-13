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
          sonarr = {
            rule = "Host(`sonarr.internal.flake.sh`)";
            entryPoints = ["web"];
            service = "sonarr";
          };
          radarr = {
            rule = "Host(`radarr.internal.flake.sh`)";
            entryPoints = ["web"];
            service = "radarr";
          };
          readarr = {
            rule = "Host(`readarr.internal.flake.sh`)";
            entryPoints = ["web"];
            service = "readarr";
          };
          whisparr = {
            rule = "Host(`whisparr.internal.flake.sh`)";
            entryPoints = ["web"];
            service = "whisparr";
          };
          prowlarr = {
            rule = "Host(`prowlarr.internal.flake.sh`)";
            entrypoints = ["web"];
            service = "prowlarr";
          };
        };
        services = {
          sonarr.loadBalancer.servers = [{url = "http://localhost:8989";}];
          radarr.loadBalancer.servers = [{url = "http://localhost:7878";}];
          readarr.loadBalancer.servers = [{url = "http://localhost:8787";}];
          whisparr.loadBalancer.servers = [{url = "http://localhost:6969";}];
          prowlarr.loadBalancer.servers = [{url = "http://localhost:9696";}];
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
