{...}: {
  networking.firewall.allowedTCPPorts = [80 443 8080];

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
            rule = "Host(`homepage.lab`)";
            entrypoints = ["web"];
            service = "homepage@docker";
          };
          searxng = {
            rule = "Host(`test`)";
            entrypoints = ["web"];
            service = "searxng@docker";
          };
          hugo = {
            rule = "Host(``)";
            entryPoints = ["websecure"];
            service = "hugo@docker";
          };
        };
      };
    };
    staticConfigOptions = {
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
            delayBeforeCheck = 0;
          };
        };
        production.acme = {
          email = "x3xr6n66@notohh.dev";
          storage = "/var/lib/traefik/acme.json";
          caServer = "https://acme-v02.api.letsencrypt.org/directory";
          dnsChallenge = {
            provider = "cloudflare";
            delayBeforeCheck = 0;
          };
        };
      };
    };
  };
}
