{ pkgs, ... }:
{
  networking.firewall.allowedTCPPorts = [
    53
    4000
  ];
  networking.firewall.allowedUDPPorts = [ 53 ];

  environment.systemPackages = [ pkgs.blocky ];

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
        blockType = "nxDomain";
        loading = {
          strategy = "fast";
          concurrency = 8;
          refreshPeriod = "4h";
        };
        blackLists =
          let
            customBlacklist = pkgs.writeText "custom.txt" ''
              /fextralife.com/
            '';
          in
          {
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
              "https://raw.githubusercontent.com/AdGoBye/AdGoBye-Blocklists/main/AGBBase.toml"
              "https://raw.githubusercontent.com/AdGoBye/AdGoBye-Blocklists/main/AGBCommunity.toml"
              "https://raw.githubusercontent.com/AdGoBye/AdGoBye-Blocklists/main/AGBUpsell.toml"
              "https://raw.githubusercontent.com/AdGoBye/AdGoBye-Blocklists/main/AGBSupporters.toml"
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
            custom = [ customBlacklist ];
          };
        whiteLists =
          let
            customWhitelist = pkgs.writeText "misc.txt" ''
              ax.phobos.apple.com.edgesuite.net
              amp-api-edge.apps.apple.com
              (\.|^)dscx\.akamaiedge\.net$
              (\.|^)wac\.phicdn\.net$
              *.flake.sh
              *.clickhouse.com
              *.discord.com
              *.last.fm
              *.spotify.com
            '';
          in
          {
            ads = [
              "https://raw.githubusercontent.com/anudeepND/whitelist/master/domains/whitelist.txt"
              "https://raw.githubusercontent.com/anudeepND/whitelist/master/domains/optional-list.txt"
            ];
            misc = [ customWhitelist ];
          };
        clientGroupsBlock = {
          default = [
            "ads"
            "tracking"
            "malicious"
            "misc"
            "catchall"
            "custom"
          ];
        };
      };
      customDNS = {
        customTTL = "1h";
        mapping =
          let
            yukiIp = "192.168.1.98";
          in
          {
            # infra

            "truenas.internal.flake.sh" = "192.168.1.199";
            "hass.internal.flake.sh" = "${yukiIp}";
            "dashboard.internal.flake.sh" = "${yukiIp}";
            "udm.internal.flake.sh" = "192.168.1.1";
            "pve.internal.flake.sh" = "192.168.1.37";
            "pbs.internal.flake.sh" = "192.168.1.38";

            # media

            "jellyfin.internal.flake.sh" = "${yukiIp}";
            "jellyseerr.internal.flake.sh" = "${yukiIp}";
            "sonarr.internal.flake.sh" = "${yukiIp}";
            "radarr.internal.flake.sh" = "${yukiIp}";
            "prowlarr.internal.flake.sh" = "${yukiIp}";
            "stash.internal.flake.sh" = "${yukiIp}";
            "immich.internal.flake.sh" = "${yukiIp}";

            # misc

            "wallos.internal.flake.sh" = "${yukiIp}";
            "synology.internal.flake.sh" = "192.168.1.71";
            "paperless.internal.flake.sh" = "${yukiIp}";
            "hoarder.internal.flake.sh" = "${yukiIp}";
            "ganymede.internal.flake.sh" = "100.121.201.47";
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
