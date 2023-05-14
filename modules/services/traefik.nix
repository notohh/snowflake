{config, ...}: {
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
    group = "docker";
    dynamicConfigOptions = {
      http = {
        routers = {
          api = {
            rule = "PathPrefix(`/api/`)";
            entryPoints = ["websecure"];
            service = "api@internal";
          };
          homepage = {
            rule = "Host(`dashboard.lab`)";
            entrypoints = ["web"];
            service = "homepage@docker";
          };
          searxng = {
            rule = "Host(`searxng.lab`)";
            entrypoints = ["web"];
            service = "searxng@docker";
          };
          hugo = {
            rule = "Host(`notohh.dev`)";
            entryPoints = ["websecure"];
            service = "hugo@docker";
            tls.domains = [{main = "*.notohh.dev";}];
            tls.certresolver = "staging";
          };
          stash = {
            rule = "Host(`stash.lab`)";
            entrypoints = ["web"];
            service = "stash@docker";
          };
          foundryvtt = {
            rule = "Host(`foundry.notohh.dev`)";
            entrypoints = ["websecure"];
            service = "foundryvtt@docker";
            tls.domains = [{main = "*.notohh.dev";}];
            tls.certresolver = "staging";
          };
        };
      };
    };
    staticConfigOptions = {
      log.level = "DEBUG";
      api.dashboard = true;
      api.insecure = true;
      providers.docker = true;
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
            delayBeforeCheck = "0";
          };
        };
        production.acme = {
          email = "x3xr6n66@notohh.dev";
          storage = "/var/lib/traefik/acme.json";
          caServer = "https://acme-v02.api.letsencrypt.org/directory";
          dnsChallenge = {
            provider = "cloudflare";
            delayBeforeCheck = "0";
          };
        };
      };
    };
  };
}
