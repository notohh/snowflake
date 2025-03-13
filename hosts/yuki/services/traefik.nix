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
        routers = let
          fqdn = "internal.flake.sh";
        in {
          # local
          api = {
            rule = "PathPrefix(`/api/`)";
            entryPoints = ["websecure"];
            service = "api@internal";
          };
          homepage = {
            rule = "Host(`dashboard.${fqdn}`)";
            entrypoints = ["websecure"];
            service = "homepage";
            tls.domains = [{main = "*.${fqdn}";}];
            tls.certresolver = "production";
          };
          stash = {
            rule = "Host(`stash.${fqdn}`)";
            entrypoints = ["websecure"];
            service = "stash";
            tls.domains = [{main = "*.${fqdn}";}];
            tls.certresolver = "production";
          };
          jellyfin = {
            rule = "Host(`jellyfin.${fqdn}`)";
            entrypoints = ["websecure"];
            service = "jellyfin";
            tls.domains = [{main = "*.${fqdn}";}];
            tls.certresolver = "production";
          };
          jellyseerr = {
            rule = "Host(`jellyseerr.${fqdn}`)";
            entrypoints = ["websecure"];
            service = "jellyseerr";
            tls.domains = [{main = "*.${fqdn}";}];
            tls.certresolver = "production";
          };
          wallos = {
            rule = "Host(`wallos.${fqdn}`)";
            entrypoints = ["websecure"];
            service = "wallos";
            tls.domains = [{main = "*.${fqdn}";}];
            tls.certresolver = "production";
          };
          hass = {
            rule = "Host(`hass.${fqdn}`)";
            entrypoints = ["websecure"];
            service = "hass";
            tls.domains = [{main = "*.${fqdn}";}];
            tls.certresolver = "production";
          };
          paperless = {
            rule = "Host(`paperless.${fqdn}`)";
            entrypoints = ["websecure"];
            service = "paperless";
            tls.domains = [{main = "*.${fqdn}";}];
            tls.certresolver = "production";
          };
          miniflux = {
            rule = "Host(`rss.${fqdn}`)";
            entrypoints = ["websecure"];
            service = "miniflux";
            tls.domains = [{main = "*.${fqdn}";}];
            tls.certresolver = "production";
          };
          # kariru
          sonarr = {
            rule = "Host(`sonarr.${fqdn}`)";
            entryPoints = ["websecure"];
            service = "sonarr";
            tls.domains = [{main = "*.${fqdn}";}];
            tls.certresolver = "production";
          };
          radarr = {
            rule = "Host(`radarr.${fqdn}`)";
            entryPoints = ["websecure"];
            service = "radarr";
            tls.domains = [{main = "*.${fqdn}";}];
            tls.certresolver = "production";
          };
          prowlarr = {
            rule = "Host(`prowlarr.${fqdn}`)";
            entrypoints = ["websecure"];
            service = "prowlarr";
            tls.domains = [{main = "*.${fqdn}";}];
            tls.certresolver = "production";
          };
          ganymede = {
            rule = "Host(`ganymede.${fqdn}`)";
            entrypoints = ["websecure"];
            service = "ganymede";
            tls.domains = [{main = "*.${fqdn}";}];
            tls.certresolver = "production";
          };
          hoarder = {
            rule = "Host(`hoarder.${fqdn}`)";
            entrypoints = ["websecure"];
            service = "hoarder";
            tls.domains = [{main = "*.${fqdn}";}];
            tls.certresolver = "production";
          };
          immich = {
            rule = "Host(`immich.${fqdn}`)";
            entrypoints = ["websecure"];
            service = "immich";
            tls.domains = [{main = "*.${fqdn}";}];
            tls.certresolver = "production";
          };
          shoko = {
            rule = "Host(`shoko.${fqdn}`)";
            entrypoints = ["websecure"];
            service = "shoko";
            tls.domains = [{main = "*.${fqdn}";}];
            tls.certresolver = "production";
          };
        };
        services = let
          kariruHost = "192.168.1.54:";
        in {
          # local
          stash.loadBalancer.servers = [{url = "http://localhost:9999";}];
          homepage.loadBalancer.servers = [{url = "http://localhost:7676";}];
          jellyfin.loadBalancer.servers = [{url = "http://localhost:8096";}];
          jellyseerr.loadBalancer.servers = [{url = "http://localhost:5055";}];
          wallos.loadBalancer.servers = [{url = "http://localhost:8282";}];
          hass.loadBalancer.servers = [{url = "http://localhost:8123";}];
          paperless.loadBalancer.servers = [{url = "http://localhost:28981";}];
          miniflux.loadBalancer.servers = [{url = "http://localhost:9000";}];
          hoarder.loadBalancer.servers = [{url = "http://localhost:3000";}];
          immich.loadBalancer.servers = [{url = "http://localhost:2283";}];
          # kariru
          sonarr.loadBalancer.servers = [{url = "http://${kariruHost}8989";}];
          radarr.loadBalancer.servers = [{url = "http://${kariruHost}7878";}];
          prowlarr.loadBalancer.servers = [{url = "http://${kariruHost}9696";}];
          shoko.loadBalancer.servers = [{url = "http://${kariruHost}8111";}];
          # sakura
          ganymede.loadBalancer.servers = [{url = "http://100.121.201.47:4000";}];
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
