_: {
  services.adguardhome.settings = {
    dns.rewrites = [
      {
        domain = "adguardhome.internal.flake.sh";
        answer = "192.168.1.103";
      }
      {
        domain = "dashboard.internal.flake.sh";
        answer = "192.168.1.98";
      }
      {
        domain = "truenas.internal.flake.sh";
        answer = "192.168.1.199";
      }
      {
        domain = "assistant.internal.flake.sh";
        answer = "192.168.1.189";
      }
      {
        domain = "udm.internal.flake.sh";
        answer = "192.168.1.1";
      }
      {
        domain = "pve.internal.flake.sh";
        answer = "192.168.1.37";
      }
      {
        domain = "pbs.internal.flake.sh";
        answer = "192.168.1.38";
      }
      {
        domain = "jellyfin.internal.flake.sh";
        answer = "192.168.1.98";
      }
      {
        domain = "jellyseerr.internal.flake.sh";
        answer = "192.168.1.98";
      }
      {
        domain = "sonarr.internal.flake.sh";
        answer = "192.168.1.54";
      }
      {
        domain = "radarr.internal.flake.sh";
        answer = "192.168.1.54";
      }
      {
        domain = "bazarr.internal.flake.sh";
        answer = "192.168.1.54";
      }
      {
        domain = "whisparr.internal.flake.sh";
        answer = "192.168.1.54";
      }
      {
        domain = "prowlarr.internal.flake.sh";
        answer = "192.168.1.54";
      }
      {
        domain = "stash.internal.flake.sh";
        answer = "192.168.1.98";
      }
      {
        domain = "nextcloud.internal.flake.sh";
        answer = "192.168.1.199";
      }
      {
        domain = "wallos.internal.flake.sh";
        answer = "192.168.1.98";
      }
      {
        domain = "synology.internal.flake.sh";
        answer = "192.168.1.71";
      }
    ];
  };
}
