_: {
  services.homepage-dashboard.services = [
    {
      "Sora" = let
        glancesUrl = "http://100.104.42.96:61208";
      in [
        {
          "INF" = {
            widget = {
              type = "glances";
              url = glancesUrl;
              metric = "info";
            };
          };
        }
        {
          "CPU" = {
            widget = {
              type = "glances";
              url = glancesUrl;
              metric = "cpu";
            };
          };
        }
        {
          "RAM" = {
            widget = {
              type = "glances";
              url = glancesUrl;
              metric = "memory";
            };
          };
        }
        {
          "PROC" = {
            widget = {
              type = "glances";
              url = glancesUrl;
              metric = "process";
            };
          };
        }
        {
          "NET" = {
            widget = {
              type = "glances";
              url = glancesUrl;
              metric = "network:eth0";
            };
          };
        }
        {
          "FS" = {
            widget = {
              type = "glances";
              url = glancesUrl;
              metric = "fs:/etc/hosts";
            };
          };
        }
      ];
    }
    {
      "Infra" = [
        {
          "Proxmox" = {
            icon = "proxmox";
            href = "https://pve.internal.flake.sh:8006";
            widget = {
              type = "proxmox";
              url = "https://192.168.1.36:8006";
              username = "{{HOMEPAGE_VAR_PROXMOX_USER}}";
              password = "{{HOMEPAGE_VAR_PROXMOX_PWD}}";
            };
          };
        }
        {
          "Proxmox Backup Server" = {
            icon = "proxmox";
            href = "https://pbs.internal.flake.sh:8007";
            widget = {
              type = "proxmoxbackupserver";
              url = "https://192.168.1.38:8007";
              username = "{{HOMEPAGE_VAR_PBS_USER}}";
              password = "{{HOMEPAGE_VAR_PBS_PWD}}";
            };
          };
        }
        {
          "TrueNAS" = {
            icon = "truenas-scale";
            href = "https://truenas.internal.flake.sh";
            widget = {
              type = "truenas";
              url = "https://192.168.1.199";
              key = "{{HOMEPAGE_VAR_TRUENAS_KEY}}";
            };
          };
        }
        {
          "Home Assistant" = {
            icon = "home-assistant";
            href = "http://hass.internal.flake.sh:8123";
            widget = {
              type = "homeassistant";
              url = "http://192.168.1.98:8123";
              key = "{{HOMEPAGE_VAR_HASS_KEY}}";
            };
          };
        }
      ];
    }
    {
      "Networking" = [
        {
          "Ubiquiti" = {
            icon = "ubiquiti";
            href = "https://udm.internal.flake.sh";
            widget = {
              type = "unifi";
              url = "https://192.168.1.1";
              username = "api";
              password = "{{HOMEPAGE_VAR_UBIQUITI_PWD}}";
            };
          };
        }
        {
          "Traefik" = {
            icon = "traefik";
            href = "http://192.168.1.98:8080/dashboard";
            widget = {
              type = "traefik";
              url = "http://192.168.1.98:8080";
            };
          };
        }
        {
          "Gluetun" = {
            icon = "gluetun";
            href = "http://192.168.1.54:8000";
            widget = {
              type = "gluetun";
              url = "http://192.168.1.54:8000";
            };
          };
        }
        {
          "Tailscale" = {
            icon = "tailscale";
            href = "https://login.tailscale.com/admin/machines";
            widget = {
              type = "tailscale";
              deviceid = "{{HOMEPAGE_VAR_TAILSCALE_DEVICE_ID}}";
              key = "{{HOMEPAGE_VAR_TAILSCALE_KEY}}";
            };
          };
        }
        {
          "Blocky" = {
            icon = "blocky";
            href = "http://192.168.1.103:4000";
          };
        }
      ];
    }
    {
      "Monitoring" = [
        {
          "Grafana" = {
            icon = "grafana";
            href = "https://metrics.flake.sh";
            widget = {
              type = "grafana";
              url = "https://metrics.flake.sh";
              username = "{{HOMEPAGE_VAR_GRAFANA_USER}}";
              password = "{{HOMEPAGE_VAR_GRAFANA_PWD}}";
            };
          };
        }
        {
          "Prometheus" = {
            icon = "prometheus";
            widget = {
              type = "prometheus";
              url = "http://100.104.42.96:9090";
            };
          };
        }
        {
          "Uptime Kuma" = {
            icon = "uptime-kuma";
            href = "https://status.flake.sh/dashboard";
            widget = {
              type = "uptimekuma";
              url = "https://status.flake.sh";
              slug = "kumo";
            };
          };
        }
        {
          "ntfy" = {
            icon = "ntfy";
            href = "https://ntfy.flake.sh";
          };
        }
      ];
    }
    {
      "Media" = let
        kariruIp = "http://192.168.1.54:";
      in [
        {
          "Jellyfin" = {
            icon = "jellyfin";
            href = "https://jellyfin.internal.flake.sh/";
            widget = {
              type = "jellyfin";
              url = "http://192.168.1.98:8096";
              key = "{{HOMEPAGE_VAR_JELLYFIN_KEY}}";
              enableBlocks = true;
              enableNowPlaying = false;
            };
          };
        }
        {
          "Jellyseerr" = {
            icon = "jellyseerr";
            href = "https://jellyseerr.internal.flake.sh";
            widget = {
              type = "jellyseerr";
              url = "http://192.168.1.98:5055";
              key = "{{HOMEPAGE_VAR_JELLYSEERR_KEY}}";
            };
          };
        }
        {
          "Sonarr" = {
            icon = "sonarr";
            href = "https://sonarr.internal.flake.sh";
            widget = {
              type = "sonarr";
              url = "${kariruIp}8989";
              key = "{{HOMEPAGE_VAR_SONARR_KEY}}";
            };
          };
        }
        {
          "Radarr" = {
            icon = "radarr";
            href = "https://radarr.internal.flake.sh";
            widget = {
              type = "radarr";
              url = "${kariruIp}7878";
              key = "{{HOMEPAGE_VAR_RADARR_KEY}}";
            };
          };
        }
        {
          "Prowlarr" = {
            icon = "prowlarr";
            href = "https://prowlarr.internal.flake.sh";
            widget = {
              type = "prowlarr";
              url = "${kariruIp}9696";
              key = "{{HOMEPAGE_VAR_PROWLARR_KEY}}";
            };
          };
        }
        {
          "qBittorrent" = {
            icon = "qbittorrent";
            href = "http://192.168.1.54:8080";
            widget = {
              type = "qbittorrent";
              url = "http://192.168.1.54:8080";
              username = "notoh";
              password = "{{HOMEPAGE_VAR_QBIT_PWD}}";
            };
          };
        }
        {
          "Stash" = {
            icon = "stash";
            href = "https://stash.internal.flake.sh";
            widget = {
              type = "stash";
              url = "https://stash.internal.flake.sh";
              key = "{{HOMEPAGE_VAR_STASH_KEY}}";
              fields = ["scenes" "sceneSize" "performers"];
            };
          };
        }
        {
          "Immich" = {
            icon = "immich";
            href = "https://immich.internal.flake.sh";
            widget = {
              type = "immich";
              url = "https://immich.internal.flake.sh";
              key = "{{HOMEPAGE_VAR_IMMICH_KEY}}";
              version = 2;
            };
          };
        }
        {
          "Whisparr" = {
            icon = "whisparr";
            href = "http://whisparr.internal.flake.sh/";
          };
        }
        {
          "Servarr" = {
            icon = "servarr";
            href = "https://wiki.servarr.com/";
          };
        }
      ];
    }
    {
      "Misc" = [
        {
          "Forgejo" = {
            icon = "forgejo";
            href = "https://git.flake.sh/explore/repos";
          };
        }
        {
          "Hetzner" = {
            icon = "hetzner";
            href = "https://accounts.hetzner.com/login";
          };
        }
        {
          "Cloudflare" = {
            icon = "cloudflare";
            href = "https://dash.cloudflare.com";
          };
        }
        {
          "Tailscale" = {
            icon = "tailscale";
            href = "https://login.tailscale.com/admin/machines";
          };
        }
        {
          "Hoarder" = {
            icon = "hoarder";
            href = "https://hoarder.internal.flake.sh";
          };
        }
        {
          "Wallos" = {
            icon = null;
            href = "https://wallos.internal.flake.sh";
          };
        }
        {
          "Ganymede" = {
            icon = null;
            href = "https://ganymede.internal.flake.sh";
          };
        }
      ];
    }
  ];
}
