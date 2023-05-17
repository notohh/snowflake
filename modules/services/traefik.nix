{config, ...}: {
  sops.secrets.cloudflare-api-key = {};
  networking.firewall.allowedTCPPorts = [80 443 8080];
  systemd.user.services.traefik.after = ["docker.service"];
  systemd.services.traefik = {
    environment = {
      CLOUDFLARE_EMAIL = "jch0tm2e@notohh.dev";
    };
    serviceConfig = {
      EnvironmentFile = config.sops.secrets.cloudflare-api-key.path;
    };
  };
  services.traefik = {
    enable = true;
    dynamicConfigOptions = {
      http = {
        services = {
          homepage.loadBalancer.servers = [{url = "http://localhost:3005";}];
          searxng.loadBalancer.servers = [{url = "http://localhost:8085";}];
          hugo.loadBalancer.servers = [{url = "http://localhost:1313";}];
          stash.loadBalancer.servers = [{url = "http://localhost:9999";}];
          jellyfin.loadBalancer.servers = [{url = "http://localhost:8096";}];
          foundryvtt.loadBalancer.servers = [{url = "http://localhost:30000";}];
          gitea.loadBalancer.servers = [{url = "http://localhost:3000";}];
        };
        routers = {
          api = {
            rule = "PathPrefix(`/api/`)";
            entryPoints = ["websecure"];
            service = "api@internal";
          };
          homepage = {
            rule = "Host(`dashboard.lab`)";
            entrypoints = ["web"];
            service = "homepage";
          };
          searxng = {
            rule = "Host(`searxng.lab`)";
            entrypoints = ["web"];
            service = "searxng";
          };
          stash = {
            rule = "Host(`stash.lab`)";
            entrypoints = ["web"];
            service = "stash";
          };
          jellyfin = {
            rule = "Host(`jellyfin.lab`)";
            entrypoints = ["web"];
            service = "jellyfin";
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
