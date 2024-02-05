{pkgs, ...}: {
  networking.firewall.allowedTCPPorts = [53 4000];
  networking.firewall.allowedUDPPorts = [53];

  environment.systemPackages = [pkgs.blocky];

  services.blocky = {
    enable = true;
    settings = {
      connectIPVersion = "v4";
      upstreamTimeout = "5s";
      startVerifyUpstream = false;
      minTlsServeVersion = "1.2";
      log = {
        level = "debug";
        privacy = true;
      };
      ports = {
        dns = 53;
        http = 4000;
        https = 443;
        tls = 853;
      };
      upstreams = {
        strategy = "strict";
        timeout = "30s";
        init.strategy = "fast";
        groups = {
          default = [
            "tcp+udp:127.0.0.1:5335"
            "tcp-tls:dns.quad9.net"
          ];
        };
      };
      blocking = {
        loading = {
          strategy = "fast";
          concurrency = 8;
          refreshPeriod = "4h";
        };
        blackLists = {
          ads = [
            "https://blocklistproject.github.io/Lists/ads.txt"
            "https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts"
            "https://adaway.org/hosts.txt"
            "https://v.firebog.net/hosts/AdguardDNS.txt"
            "https://v.firebog.net/hosts/Admiral.txt"
            "https://raw.githubusercontent.com/anudeepND/blacklist/master/adservers.txt"
            "https://s3.amazonaws.com/lists.disconnect.me/simple_ad.txt"
            "https://v.firebog.net/hosts/Easylist.txt"
            "https://pgl.yoyo.org/adservers/serverlist.php?hostformat=hosts&showintro=0&mimetype=plaintext"
            "https://raw.githubusercontent.com/FadeMind/hosts.extras/master/UncheckyAds/hosts"
            "https://raw.githubusercontent.com/bigdargon/hostsVN/master/hosts"
          ];
          tracking = [
            "https://v.firebog.net/hosts/Easyprivacy.txt"
            "https://v.firebog.net/hosts/Prigent-Ads.txt"
            "https://raw.githubusercontent.com/FadeMind/hosts.extras/master/add.2o7Net/hosts"
            "https://raw.githubusercontent.com/crazy-max/WindowsSpyBlocker/master/data/hosts/spy.txt"
            "https://hostfiles.frogeye.fr/firstparty-trackers-hosts.txt"
          ];
          malicious = [
            "https://raw.githubusercontent.com/DandelionSprout/adfilt/master/Alternate%20versions%20Anti-Malware%20List/AntiMalwareHosts.txt"
            "https://osint.digitalside.it/Threat-Intel/lists/latestdomains.txt"
            "https://s3.amazonaws.com/lists.disconnect.me/simple_malvertising.txt"
            "https://v.firebog.net/hosts/Prigent-Crypto.txt"
            "https://raw.githubusercontent.com/FadeMind/hosts.extras/master/add.Risk/hosts"
            "https://v.firebog.net/hosts/RPiList-Phishing.txt"
            "https://v.firebog.net/hosts/RPiList-Malware.txt"
          ];
          misc = [
            "https://zerodot1.gitlab.io/CoinBlockerLists/hosts_browser"
            "https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-only/hosts"
          ];
          catchall = [
            "https://big.oisd.nl/domainswild"
          ];
        };
        whiteLists = let
          customWhitelist = pkgs.writeText "misc.txt" ''
            ax.phobos.apple.com.edgesuite.net
            amp-api-edge.apps.apple.com
            (\.|^)dscx\.akamaiedge\.net$
            (\.|^)wac\.phicdn\.net$
            *.flake.sh
          '';
        in {
          ads = [
            "https://raw.githubusercontent.com/anudeepND/whitelist/master/domains/whitelist.txt"
            "https://raw.githubusercontent.com/anudeepND/whitelist/master/domains/optional-list.txt"
          ];
          misc = [customWhitelist];
        };
        clientGroupsBlock = {
          default = [
            "ads"
            "tracking"
            "malicious"
            "misc"
            "catchall"
          ];
        };
      };
      customDNS = {
        customTTL = "1h";
        mapping = {
          # infra

          "truenas.internal.flake.sh" = "192.168.1.199";
          "hass.internal.flake.sh" = "192.168.1.98";
          "dashboard.internal.flake.sh" = "192.168.1.98";
          "udm.internal.flake.sh" = "192.168.1.1";
          "pve.internal.flake.sh" = "192.168.1.37";
          "pbs.internal.flake.sh" = "192.168.1.38";

          # media

          "jellyfin.internal.flake.sh" = "192.168.1.98";
          "jellyseerr.internal.flake.sh" = "192.168.1.98";
          "sonarr.internal.flake.sh" = "192.168.1.98";
          "radarr.internal.flake.sh" = "192.168.1.98";
          "readarr.internal.flake.sh" = "192.168.1.98";
          "lidarr.internal.flake.sh" = "192.168.1.98";
          "whisparr.internal.flake.sh" = "192.168.1.98";
          "bazarr.internal.flake.sh" = "192.168.1.98";
          "prowlarr.internal.flake.sh" = "192.168.1.98";
          "stash.internal.flake.sh" = "192.168.1.98";
          "nextcloud.internal.flake.sh" = "192.168.1.199";

          # misc

          "wallos.internal.flake.sh" = "192.168.1.98";
          "synology.internal.flake.sh" = "192.168.1.71";
          "paperless.internal.flake.sh" = "192.168.1.98";
          "rss.internal.flake.sh" = "192.168.1.98";
        };
      };
      redis = {
        address = "192.168.1.211:6381";
        password = "blocky";
        database = 0;
        required = false;
        connectionAttempts = 10;
        connectionCooldown = "5s";
      };
      caching = {
        minTime = "2h";
        maxTime = "12h";
        maxItemsCount = 0;
        prefetching = true;
        prefetchExpires = "2h";
        prefetchThreshold = 5;
      };
      prometheus = {
        enable = true;
        path = "/metrics";
      };
      queryLog = {
        type = "console";
      };
    };
  };
}
