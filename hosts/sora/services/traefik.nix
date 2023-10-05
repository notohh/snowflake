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
        middlewares.authelia = {
          forwardauth = {
            address = "http://100.121.201.47:9091/api/verify?rd=https://passport.notohh.dev/";
            trustForwardHeader = true;
          };
        };
        routers = {
          api = {
            rule = "PathPrefix(`/api/`)";
            entrypoints = ["websecure"];
            service = "api@internal";
          };
          uptime-kuma = {
            rule = "Host(`status.flake.sh`)";
            entrypoints = ["websecure"];
            service = "uptime-kuma";
            tls.domains = [{main = "*.flake.sh";}];
            tls.certresolver = "production";
          };
          gotify = {
            rule = "Host(`gotify.flake.sh`)";
            entrypoints = ["websecure"];
            service = "gotify";
            tls.domains = [{main = "*.flake.sh";}];
            tls.certresolver = "production";
          };
          conduit = {
            rule = "Host(`matrix.flake.sh`)";
            entrypoints = ["websecure"];
            service = "conduit";
            tls.domains = [{main = "*.flake.sh";}];
            tls.certresolver = "production";
          };
          authelia = {
            rule = "Host(`passport.notohh.dev`)";
            entrypoints = ["websecure"];
            service = "authelia";
            tls.domains = [{main = "*.notohh.dev";}];
            tls.certresolver = "production";
          };
        };
        services = {
          uptime-kuma.loadBalancer.servers = [{url = "http://100.87.54.48:4000";}];
          gotify.loadBalancer.servers = [{url = "http://100.87.54.48:3000";}];
          conduit.loadBalancer.servers = [{url = "http://100.121.201.47:6167";}];
          authelia.loadBalancer.servers = [{url = "http://100.121.201.47:9091";}];
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
        };
      };
      metrics = {
        prometheus = {
          addServicesLabels = true;
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
