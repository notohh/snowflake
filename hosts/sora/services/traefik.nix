{ config, ... }:
{
  sops.secrets = {
    cloudflare-api-key = { };
    traefik-oidc-id = {
      owner = "traefik";
    };
    traefik-oidc-secret = {
      owner = "traefik";
    };
  };
  networking.firewall.allowedTCPPorts = [
    80
    443
    2222
    8080
  ];
  systemd.services.traefik = {
    environment = {
      CLOUDFLARE_EMAIL = "jch0tm2e@notohh.dev";
    };
    serviceConfig = {
      EnvironmentFile = [ config.sops.secrets.cloudflare-api-key.path ];
    };
  };
  services.traefik = {
    enable = true;
    dynamic = {
      dir = "/var/lib/traefik/dynamic";
      files."default".settings = {
        tcp = {
          routers = {
            gitssh = {
              rule = "HostSNI(`*`)";
              entrypoints = [ "ssh" ];
              service = "gitssh";
            };
          };
          services = {
            gitssh.loadBalancer.servers = [ { address = "100.121.201.47:2222"; } ];
          };
        };
        http = {
          middlewares = {
            forgejo-oidc-auth = {
              plugin = {
                traefik-oidc-auth = {
                  Provider = {
                    Url = "https://passport.notohh.dev";
                    ClientId = "${config.sops.secrets.traefik-oidc-id.path}";
                    ClientSecret = "${config.sops.secrets.traefik-oidc-secret.path}";
                  };
                  Scopes = [
                    "openid"
                    "profile"
                    "email"
                  ];
                };
              };
            };
            redirect-flake-sh = {
              redirectregex = {
                regex = "^https?://flake\\.sh/(.*)";
                replacement = "https://notohh.dev/";
                permanent = false;
              };
            };
            redirect-to-https = {
              redirectscheme = {
                scheme = "https";
                permanent = true;
              };
            };
            cors = {
              headers = {
                accessControlAllowOriginList = "https://daphbot.notohh.dev";
              };
            };
            cors-allow-all = {
              headers = {
                accessControlAllowOriginList = "*";
              };
            };
          };
          routers =
            let
              pqdn = "flake.sh";
            in
            {
              api = {
                rule = "PathPrefix(`/api/`)";
                entrypoints = [ "websecure" ];
                service = "api@internal";
              };
              pocketid = {
                rule = "Host(`passport.notohh.dev`)";
                entrypoints = [ "websecure" ];
                service = "pocketid";
                tls.domains = [ { main = "*.notohh.dev"; } ];
                tls.certresolver = "production";
              };
              flake-sh = {
                rule = "Host(`${pqdn}`)";
                entrypoints = [ "websecure" ];
                service = "noop@internal";
                middlewares = "redirect-flake-sh";
                tls.domains = [ { main = "*.${pqdn}"; } ];
                tls.certresolver = "production";
              };
              uptime-kuma = {
                rule = "Host(`status.${pqdn}`)";
                entrypoints = [ "websecure" ];
                service = "uptime-kuma";
                tls.domains = [ { main = "*.${pqdn}"; } ];
                tls.certresolver = "production";
              };
              foundryvtt = {
                rule = "Host(`foundry.${pqdn}`)";
                entrypoints = [ "websecure" ];
                service = "foundryvtt";
                tls.domains = [ { main = "*.${pqdn}"; } ];
                tls.certresolver = "production";
              };
              forgejo = {
                rule = "Host(`git.${pqdn}`)";
                entrypoints = [ "websecure" ];
                service = "forgejo";
                tls.domains = [ { main = "*.${pqdn}"; } ];
                tls.certresolver = "production";
                middlewares = "cors";
              };
              rustypaste = {
                rule = "Host(`i.${pqdn}`)";
                entrypoints = [ "websecure" ];
                service = "rustypaste";
                tls.domains = [ { main = "*.${pqdn}"; } ];
                tls.certresolver = "production";
              };
              grafana = {
                rule = "Host(`metrics.${pqdn}`)";
                entrypoints = [ "websecure" ];
                service = "grafana";
                tls.domains = [ { main = "*.${pqdn}"; } ];
                tls.certresolver = "production";
              };
              vaultwarden = {
                rule = "Host(`vault.${pqdn}`)";
                entrypoints = [ "websecure" ];
                service = "vaultwarden";
                tls.domains = [ { main = "*.${pqdn}"; } ];
                tls.certresolver = "production";
              };
              ntfy = {
                rule = "Host(`ntfy.${pqdn}`)";
                entrypoints = [ "websecure" ];
                service = "ntfy-sh";
                tls.domains = [ { main = "*.${pqdn}"; } ];
                tls.certresolver = "production";
              };
              attic = {
                rule = "Host(`cache.${pqdn}`)";
                entrypoints = [ "websecure" ];
                service = "attic";
                tls.domains = [ { main = "*.${pqdn}"; } ];
                tls.certresolver = "production";
              };
              wastebin = {
                rule = "Host(`paste.${pqdn}`)";
                entrypoints = [ "websecure" ];
                service = "wastebin";
                tls.domains = [ { main = "*.${pqdn}"; } ];
                tls.certresolver = "production";
              };
              copyparty = {
                rule = "Host(`f.${pqdn}`)";
                entrypoints = [ "websecure" ];
                service = "copyparty";
                tls.domains = [ { main = "*.${pqdn}"; } ];
                tls.certresolver = "production";
              };
              owncast = {
                rule = "Host(`video.${pqdn}`)";
                entrypoints = [ "websecure" ];
                service = "owncast";
                tls.domains = [ { main = "*.${pqdn}"; } ];
                tls.certresolver = "production";
              };
            };
          services =
            let
              sakuraIp = "100.121.201.47:";
              soraIp = "100.104.42.96:";
            in
            {
              # sora
              uptime-kuma.loadBalancer.servers = [ { url = "http://${soraIp}4000"; } ];
              foundryvtt.loadBalancer.servers = [ { url = "http://${soraIp}30000"; } ];
              ntfy-sh.loadBalancer.servers = [ { url = "http://${soraIp}8090"; } ];
              attic.loadBalancer.servers = [ { url = "http://${soraIp}8200"; } ];

              # sakura
              forgejo.loadBalancer.servers = [ { url = "http://${sakuraIp}3200"; } ];
              authelia.loadBalancer.servers = [ { url = "http://${sakuraIp}9091"; } ];
              rustypaste.loadBalancer.servers = [ { url = "http://${sakuraIp}8000"; } ];
              grafana.loadBalancer.servers = [ { url = "http://${sakuraIp}3100"; } ];
              vaultwarden.loadBalancer.servers = [ { url = "http://${sakuraIp}8222"; } ];
              wastebin.loadBalancer.servers = [ { url = "http://${sakuraIp}8088"; } ];
              copyparty.loadBalancer.servers = [ { url = "http://${sakuraIp}3210"; } ];
              pocketid.loadBalancer.servers = [ { url = "http://${sakuraIp}1411"; } ];

              # tsuru
              owncast.loadBalancer.servers = [ { url = "http://100.127.30.116:8100"; } ];
            };
        };
      };
    };
    static.settings = {
      log.level = "INFO";
      api.dashboard = false;
      api.insecure = false;
      experimental = {
        plugins = {
          traefik-oidc-auth = {
            moduleName = "github.com/sevensolutions/traefik-oidc-auth";
            version = "v0.17.0";
          };
        };
      };
      global = {
        checkNewVersion = false;
        sendAnonymousUsage = false;
      };
      entryPoints = {
        websecure = {
          address = ":443";
          transport = {
            respondingTimeouts.readTimeout = "0s";
          };
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
            resolvers = [
              "1.1.1.1:53"
              "1.0.0.1:53"
            ];
            delayBeforeCheck = "0";
          };
        };
        production.acme = {
          email = "x3xr6n66@notohh.dev";
          storage = "/var/lib/traefik/acme.json";
          caServer = "https://acme-v02.api.letsencrypt.org/directory";
          dnsChallenge = {
            provider = "cloudflare";
            resolvers = [
              "1.1.1.1:53"
              "1.0.0.1:53"
            ];
            delayBeforeCheck = "0";
          };
        };
      };
    };
  };
}
