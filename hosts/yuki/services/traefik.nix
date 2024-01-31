{config, ...}: {
  networking.firewall.allowedTCPPorts = [80 443 8080];
  sops.secrets.cloudflare-api-key = {};
  systemd.services.traefik = {
    environment = {
      CLOUDFLARE_EMAIL = "jch0tm2e@notohh.dev";
    };
    serviceConfig = {
      EnvironmentFile = [config.sops.secrets.cloudflare-api-key.path];
    };
  };
  services.traefik = {
    enable = true;
    dynamicConfigOptions = {
      http = {
        routers = {
          # local
          api = {
            rule = "PathPrefix(`/api/`)";
            entryPoints = ["websecure"];
            service = "api@internal";
          };
          homepage = {
            rule = "Host(`dashboard.internal.flake.sh`)";
            entrypoints = ["websecure"];
            service = "homepage";
            tls.domains = [{main = "*.internal.flake.sh";}];
            tls.certresolver = "production";
          };
          stash = {
            rule = "Host(`stash.internal.flake.sh`)";
            entrypoints = ["websecure"];
            service = "stash";
            tls.domains = [{main = "*.internal.flake.sh";}];
            tls.certresolver = "production";
          };
          jellyfin = {
            rule = "Host(`jellyfin.internal.flake.sh`)";
            entrypoints = ["websecure"];
            service = "jellyfin";
            tls.domains = [{main = "*.internal.flake.sh";}];
            tls.certresolver = "production";
          };
          jellyseerr = {
            rule = "Host(`jellyseerr.internal.flake.sh`)";
            entrypoints = ["websecure"];
            service = "jellyseerr";
            tls.domains = [{main = "*.internal.flake.sh";}];
            tls.certresolver = "production";
          };
          wallos = {
            rule = "Host(`wallos.internal.flake.sh`)";
            entrypoints = ["websecure"];
            service = "wallos";
            tls.domains = [{main = "*.internal.flake.sh";}];
            tls.certresolver = "production";
          };
          searxng = {
            rule = "Host(`search.internal.flake.sh`)";
            entrypoints = ["websecure"];
            service = "searxng";
            tls.domains = [{main = "*.internal.flake.sh";}];
            tls.certresolver = "production";
          };
          hass = {
            rule = "Host(`hass.internal.flake.sh`)";
            entrypoints = ["websecure"];
            service = "hass";
            tls.domains = [{main = "*.internal.flake.sh";}];
            tls.certresolver = "production";
          };
          paperless = {
            rule = "Host(`paperless.internal.flake.sh`)";
            entrypoints = ["websecure"];
            service = "paperless";
            tls.domains = [{main = "*.internal.flake.sh";}];
            tls.certresolver = "production";
          };
          # kariru
          sonarr = {
            rule = "Host(`sonarr.internal.flake.sh`)";
            entryPoints = ["websecure"];
            service = "sonarr";
            tls.domains = [{main = "*.internal.flake.sh";}];
            tls.certresolver = "production";
          };
          radarr = {
            rule = "Host(`radarr.internal.flake.sh`)";
            entryPoints = ["websecure"];
            service = "radarr";
            tls.domains = [{main = "*.internal.flake.sh";}];
            tls.certresolver = "production";
          };
          readarr = {
            rule = "Host(`readarr.internal.flake.sh`)";
            entryPoints = ["websecure"];
            service = "readarr";
            tls.domains = [{main = "*.internal.flake.sh";}];
            tls.certresolver = "production";
          };
          lidarr = {
            rule = "Host(`lidarr.internal.flake.sh`)";
            entryPoints = ["websecure"];
            service = "lidarr";
            tls.domains = [{main = "*.internal.flake.sh";}];
            tls.certresolver = "production";
          };
          bazarr = {
            rule = "Host(`bazarr.internal.flake.sh`)";
            entryPoints = ["websecure"];
            service = "bazarr";
            tls.domains = [{main = "*.internal.flake.sh";}];
            tls.certresolver = "production";
          };
          whisparr = {
            rule = "Host(`whisparr.internal.flake.sh`)";
            entryPoints = ["websecure"];
            service = "whisparr";
            tls.domains = [{main = "*.internal.flake.sh";}];
            tls.certresolver = "production";
          };
          prowlarr = {
            rule = "Host(`prowlarr.internal.flake.sh`)";
            entrypoints = ["websecure"];
            service = "prowlarr";
            tls.domains = [{main = "*.internal.flake.sh";}];
            tls.certresolver = "production";
          };
        };
        services = {
          # local
          stash.loadBalancer.servers = [{url = "http://localhost:9999";}];
          homepage.loadBalancer.servers = [{url = "http://localhost:7676";}];
          jellyfin.loadBalancer.servers = [{url = "http://localhost:8096";}];
          jellyseerr.loadBalancer.servers = [{url = "http://localhost:5055";}];
          wallos.loadBalancer.servers = [{url = "http://localhost:8282";}];
          searxng.loadBalancer.servers = [{url = "http://localhost:8100";}];
          hass.loadBalancer.servers = [{url = "http://localhost:8123";}];
          paperless.loadBalancer.servers = [{url = "http://localhost:28981";}];
          # kariru
          sonarr.loadBalancer.servers = [{url = "http://192.168.1.54:8989";}];
          radarr.loadBalancer.servers = [{url = "http://192.168.1.54:7878";}];
          readarr.loadBalancer.servers = [{url = "http://192.168.1.54:8787";}];
          lidarr.loadBalancer.servers = [{url = "http://192.168.1.54:8686";}];
          bazarr.loadBalancer.servers = [{url = "http://192.168.1.54:6767";}];
          whisparr.loadBalancer.servers = [{url = "http://192.168.1.54:6969";}];
          prowlarr.loadBalancer.servers = [{url = "http://192.168.1.54:9696";}];
        };
      };
    };
    staticConfigOptions = {
      log.level = "DEBUG";
      api.dashboard = true;
      api.insecure = true;
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
      certificatesResolvers = {
        production.acme = {
          email = "x3xr6n66@notohh.dev";
          storage = "/var/lib/traefik/acme.json";
          caServer = "https://acme-v02.api.letsencrypt.org/directory";
          dnsChallenge = {
            provider = "cloudflare";
            resolvers = ["1.1.1.1:53" "1.0.0.1:53"];
            delayBeforeCheck = "0";
          };
        };
      };
    };
  };
}
