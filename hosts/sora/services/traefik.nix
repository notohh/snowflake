{config, ...}: {
  sops.secrets.cloudflare-api-key = {};
  networking.firewall.allowedTCPPorts = [80 443 2222 8080];
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
      tcp = {
        routers = {
          gitssh = {
            rule = "HostSNI(`*`)";
            entrypoints = ["ssh"];
            service = "gitssh";
          };
        };
        services = {
          gitssh.loadBalancer.servers = [{address = "100.121.201.47:2222";}];
        };
      };
      http = {
        middlewares = {
          authelia = {
            forwardauth = {
              address = "http://100.121.201.47:9091/api/verify?rd=https://passport.notohh.dev/";
              trustForwardHeader = true;
            };
          };
          redirect-to-https = {
            redirectscheme.scheme = "https";
            redirectscheme.permanent = true;
          };
          cors = {
            headers = {
              accessControlAllowOriginList = "https://daphbot.notohh.dev";
            };
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
          foundryvtt = {
            rule = "Host(`foundry.flake.sh`)";
            entrypoints = ["websecure"];
            service = "foundryvtt";
            tls.domains = [{main = "*.flake.sh";}];
            tls.certresolver = "production";
          };
          forgejo = {
            rule = "Host(`git.flake.sh`)";
            entrypoints = ["websecure"];
            service = "forgejo";
            tls.domains = [{main = "*.flake.sh";}];
            tls.certresolver = "production";
            middlewares = "cors";
          };
          rustypaste = {
            rule = "Host(`i.flake.sh`)";
            entrypoints = ["websecure"];
            service = "rustypaste";
            tls.domains = [{main = "*.flake.sh";}];
            tls.certresolver = "production";
          };
          grafana = {
            rule = "Host(`metrics.flake.sh`)";
            entrypoints = ["websecure"];
            service = "grafana";
            tls.domains = [{main = "*.flake.sh";}];
            tls.certresolver = "production";
          };
          hedgedoc = {
            rule = "Host(`scratch.flake.sh`)";
            entrypoints = ["websecure"];
            service = "hedgedoc";
            tls.domains = [{main = "*.flake.sh";}];
            tls.certresolver = "production";
          };
          vaultwarden = {
            rule = "Host(`vault.flake.sh`)";
            entrypoints = ["websecure"];
            service = "vaultwarden";
            tls.domains = [{main = "*.flake.sh";}];
            tls.certresolver = "production";
          };
          neko = {
            rule = "Host(`neko.flake.sh`)";
            entrypoints = ["websecure"];
            service = "neko";
            tls.domains = [{main = "*.flake.sh";}];
            tls.certresolver = "production";
          };
          justlog = {
            rule = "Host(`logs.flake.sh`)";
            entrypoints = ["websecure"];
            service = "justlog";
            tls.domains = [{main = "*.flake.sh";}];
            tls.certresolver = "production";
          };
        };
        services = {
          forgejo.loadBalancer = {
            passHostHeader = true;
            servers = [{url = "http://100.121.201.47:3200";}];
          };
          uptime-kuma.loadBalancer.servers = [{url = "http://100.104.42.96:4000";}];
          gotify.loadBalancer.servers = [{url = "http://100.104.42.96:3000";}];
          conduit.loadBalancer.servers = [{url = "http://100.121.201.47:6167";}];
          authelia.loadBalancer.servers = [{url = "http://100.121.201.47:9091";}];
          foundryvtt.loadBalancer.servers = [{url = "http://100.121.201.47:30000";}];
          rustypaste.loadBalancer.servers = [{url = "http://100.121.201.47:8000";}];
          grafana.loadBalancer.servers = [{url = "http://100.121.201.47:3100";}];
          hedgedoc.loadBalancer.servers = [{url = "http://100.121.201.47:3300";}];
          vaultwarden.loadBalancer.servers = [{url = "http://100.121.201.47:8222";}];
          searxng.loadBalancer.servers = [{url = "http://100.121.201.47:8100";}];
          neko.loadBalancer.servers = [{url = "http://100.104.42.96:8085";}];
          justlog.loadBalancer.servers = [{url = "http://100.121.201.47:8025";}];
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
        };
        web = {
          address = ":80";
          http.redirections.entryPoint = {
            to = "websecure";
            scheme = "https";
          };
        };
        ssh = {
          address = ":2222";
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
