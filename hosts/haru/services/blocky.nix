{...}: {
  networking.firewall.allowedTCPPorts = [53 4000];
  networking.firewall.allowedUDPPorts = [53];

  services.blocky = {
    enable = true;
    settings = {
      connectIPVersion = "v4";
      upstreamTimeout = "30s";
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
      };
      upstream.default = [
        "1.1.1.1"
        "1.0.0.1"
        "9.9.9.9"
        "https://1.1.1.1/dns-query"
        "https://dns.quad9.net/dns-query"
        "https://dns-unfiltered.adguard.com/dns-query"
      ];
      blocking = {
        loading = {
          strategy = "fast";
          concurrency = 8;
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
        };
        whiteLists = {
          default = [
            "https://raw.githubusercontent.com/anudeepND/whitelist/master/domains/whitelist.txt"
            # "https://raw.githubusercontent.com/anudeepND/whitelist/master/domains/optional-list.txt"
          ];
        };
        clientGroupsBlock = {
          default = [
            "ads"
            "tracking"
            "malicious"
            "misc"
          ];
        };
      };
      customDNS = {
        customTTL = "1h";
        mapping = {
          # infra

          "truenas.internal.flake.sh" = "192.168.1.199";
          "assistant.internal.flake.sh" = "192.168.1.189";
          "dashboard.internal.flake.sh" = "192.168.1.36";
          "udm.internal.flake.sh" = "192.168.1.1";
          "pve.internal.flake.sh" = "192.168.1.37";

          # media

          "jellyfin.internal.flake.sh" = "192.168.1.36";
          "jellyseerr.internal.flake.sh" = "192.168.1.36";
          "sonarr.internal.flake.sh" = "192.168.1.54";
          "radarr.internal.flake.sh" = "192.168.1.54";
          "bazarr.internal.flake.sh" = "192.168.1.54";
          "prowlarr.internal.flake.sh" = "192.168.1.54";
          "stash.internal.flake.sh" = "192.168.1.36";

          # misc

          "wallos.internal.flake.sh" = "192.168.1.36";
        };
      };
      redis = {
        address = "100.94.214.100:6381";
        password = "blocky";
        database = 2;
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
    };
  };
}
