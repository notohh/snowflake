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
            rule = "Host(`sonarr.home.arpa`)";
            entryPoints = ["web"];
            service = "sonarr";
          };
          radarr = {
            rule = "Host(`radarr.home.arpa`)";
            entryPoints = ["web"];
            service = "radarr";
          };
          prowlarr = {
            rule = "Host(`prowlarr.home.arpa`)";
            entrypoints = ["web"];
            service = "prowlarr";
          };
          bazarr = {
            rule = "Host(`bazarr.home.arpa`)";
            entrypoints = ["web"];
            service = "bazarr";
          };
          qbittorrent = {
            rule = "Host(`torrent.home.arpa`)";
            entrypoints = ["web"];
            service = "qbittorrent";
          };
        };
        services = {
          sonarr.loadBalancer.servers = [{url = "http://localhost:8989";}];
          radarr.loadBalancer.servers = [{url = "http://localhost:7878";}];
          prowlarr.loadBalancer.servers = [{url = "http://localhost:9696";}];
          bazarr.loadBalancer.servers = [{url = "http://localhost:6767";}];
          qbittorrent.loadBalancer.servers = [{url = "http://localhost:8080";}];
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
