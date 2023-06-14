{config, ...}: {
  sops.secrets.cloudflare-api-key = {};
  networking.firewall.allowedTCPPorts = [80 443];
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
          api = {
            rule = "PathPrefix(`/api/`)";
            entryPoints = ["websecure"];
            service = "api@internal";
          };
          jellyfin = {
            rule = "Host(`jellyfin.home.arpa`)";
            entrypoints = ["web"];
            service = "jellyfin";
          };
          dashdot = {
            rule = "Host(`dashdot.sakura.home.arpa`)";
            entrypoints = ["web"];
            service = "dashdot";
          };
          hugo = {
            rule = "Host(`notohh.dev`)";
            entryPoints = ["websecure"];
            service = "hugo";
            tls.domains = [{main = "*.notohh.dev";}];
            tls.certresolver = "production";
          };
          foundryvtt = {
            rule = "Host(`foundry.notohh.dev`)";
            entrypoints = ["websecure"];
            service = "foundryvtt";
            tls.domains = [{main = "*.notohh.dev";}];
            tls.certresolver = "production";
          };
          gitea = {
            rule = "Host(`git.notohh.dev`)";
            entrypoints = ["websecure"];
            service = "gitea";
            tls.domains = [{main = "*.notohh.dev";}];
            tls.certresolver = "production";
          };
          rustypaste = {
            rule = "Host(`img.notohh.dev`)";
            entrypoints = ["websecure"];
            service = "rustypaste";
            tls.domains = [{main = "*.notohh.dev";}];
            tls.certresolver = "production";
          };
          grafana = {
            rule = "Host(`metrics.notohh.dev`)";
            entrypoints = ["websecure"];
            service = "grafana";
            tls.domains = [{main = "*.notohh.dev";}];
            tls.certresolver = "production";
          };
          woodpecker-server = {
            rule = "Host(`ci.notohh.dev`)";
            entrypoints = ["websecure"];
            service = "woodpecker-server";
            tls.domains = [{main = "*.notohh.dev";}];
            tls.certresolver = "production";
          };
          atticd = {
            rule = "Host(`cache.notohh.dev`)";
            entrypoints = ["websecure"];
            service = "atticd";
            tls.domains = [{main = "*.notohh.dev";}];
            tls.certresolver = "production";
          };
          hedgedoc = {
            rule = "Host(`scratch.notohh.dev`)";
            entrypoints = ["websecure"];
            service = "hedgedoc";
            tls.domains = [{main = "*.notohh.dev";}];
            tls.certresolver = "production";
          };
        };
        services = {
          dashdot.loadBalancer.servers = [{url = "http://localhost:4000";}];
          hugo.loadBalancer.servers = [{url = "http://localhost:1313";}];
          jellyfin.loadBalancer.servers = [{url = "http://localhost:8096";}];
          foundryvtt.loadBalancer.servers = [{url = "http://localhost:30000";}];
          gitea.loadBalancer.servers = [{url = "http://localhost:3200";}];
          rustypaste.loadBalancer.servers = [{url = "http://localhost:8000";}];
          grafana.loadBalancer.servers = [{url = "http://localhost:3100";}];
          woodpecker-server.loadBalancer.servers = [{url = "http://localhost:8200";}];
          atticd.loadBalancer.servers = [{url = "http://localhost:8100";}];
          hedgedoc.loadBalancer.servers = [{url = "http://localhost:3300";}];
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
        };
        web = {
          address = ":80";
          forwardedHeaders.insecure = true;
        };
      };
      certificatesResolvers = {
        staging.acme = {
          email = "x3xr6n66@notohh.dev";
          storage = "/var/lib/traefik/acme.json";
          caServer = "https://acme-staging-v02.api.letsencrypt.org/directory";
          dnsChallenge = {
            provider = "cloudflare";
            resolvers = ["1.1.1.1:53" "1.0.0.1:53"];
            delayBeforeCheck = "0";
          };
        };
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
