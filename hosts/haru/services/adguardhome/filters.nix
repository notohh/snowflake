_: {
  services.adguardhome.settings = {
    filters = [
      {
        name = "blocklistproject";
        enabled = true;
        url = "https://blocklistproject.github.io/Lists/ads.txt";
        id = 1;
      }
      {
        name = "StevenBlack";
        enabled = true;
        url = "https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts";
        id = 2;
      }
      {
        name = "adaway";
        enabled = true;
        url = "https://adaway.org/hosts.txt";
        id = 3;
      }
      {
        name = "v.fire.blog";
        enabled = true;
        url = "https://v.firebog.net/hosts/AdguardDNS.txt";
        id = 4;
      }
      {
        name = "v.fire.blog";
        enabled = true;
        url = "https://v.firebog.net/hosts/Admiral.txt";
        id = 5;
      }
      {
        name = "anudeepND";
        enabled = true;
        url = "https://raw.githubusercontent.com/anudeepND/blacklist/master/adservers.txt";
        id = 6;
      }
      {
        name = "simple_ad";
        enabled = true;
        url = "https://s3.amazonaws.com/lists.disconnect.me/simple_ad.txt";
        id = 7;
      }
      {
        name = "v.fire.blog";
        enabled = true;
        url = "https://v.firebog.net/hosts/Easylist.txt";
        id = 8;
      }
      {
        name = "pgl.yoyo.org";
        enabled = true;
        url = "https://pgl.yoyo.org/adservers/serverlist.php?hostformat=hosts&showintro=0&mimetype=plaintext";
        id = 9;
      }
      {
        name = "UncheckyAds";
        enabled = true;
        url = "https://raw.githubusercontent.com/FadeMind/hosts.extras/master/UncheckyAds/hosts";
        id = 10;
      }
      {
        name = "bigdargon";
        enabled = true;
        url = "https://raw.githubusercontent.com/bigdargon/hostsVN/master/hosts";
        id = 11;
      }
      {
        name = "v.fire.blog";
        enabled = true;
        url = "https://v.firebog.net/hosts/Easyprivacy.txt";
        id = 12;
      }
      {
        name = "v.fire.blog";
        enabled = true;
        url = "https://v.firebog.net/hosts/Prigent-Ads.txt";
        id = 13;
      }
      {
        name = "FadeMind";
        enabled = true;
        url = "https://raw.githubusercontent.com/FadeMind/hosts.extras/master/add.2o7Net/hosts";
        id = 14;
      }
      {
        name = "crazy-max";
        enabled = true;
        url = "https://raw.githubusercontent.com/crazy-max/WindowsSpyBlocker/master/data/hosts/spy.txt";
        id = 15;
      }
      {
        name = "hostfiles.frogeye.fr";
        enabled = true;
        url = "https://hostfiles.frogeye.fr/firstparty-trackers-hosts.txt";
        id = 16;
      }
      {
        name = "DandelionSprout";
        enabled = true;
        url = "https://raw.githubusercontent.com/DandelionSprout/adfilt/master/Alternate%20versions%20Anti-Malware%20List/AntiMalwareHosts.txt";
        id = 17;
      }
      {
        name = "osint.digitalside.it";
        enabled = true;
        url = "https://osint.digitalside.it/Threat-Intel/lists/latestdomains.txt";
        id = 18;
      }
      {
        name = "simple_malvertising";
        enabled = true;
        url = "https://s3.amazonaws.com/lists.disconnect.me/simple_malvertising.txt";
        id = 19;
      }
      {
        name = "v.fire.blog";
        enabled = true;
        url = "https://v.firebog.net/hosts/Prigent-Crypto.txt";
        id = 20;
      }
      {
        name = "FadeMind";
        enabled = true;
        url = "https://raw.githubusercontent.com/FadeMind/hosts.extras/master/add.Risk/hosts";
        id = 21;
      }
      {
        name = "v.fire.blog";
        enabled = true;
        url = "https://v.firebog.net/hosts/RPiList-Phishing.txt";
        id = 22;
      }
      {
        name = "v.fire.blog";
        enabled = true;
        url = "https://v.firebog.net/hosts/RPiList-Malware.txt";
        id = 23;
      }
      {
        name = "zerodot1.gitlab.io";
        enabled = true;
        url = "https://zerodot1.gitlab.io/CoinBlockerLists/hosts_browser";
        id = 24;
      }
      {
        name = "StevenBlack";
        enabled = true;
        url = "https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-only/hosts";
        id = 25;
      }
    ];
    whitelist_filters = [
      {
        name = "whitelist";
        enabled = true;
        url = "https://raw.githubusercontent.com/anudeepND/whitelist/master/domains/whitelist.txt";
        id = 1;
      }
      {
        name = "whitelist - optionals";
        enabled = true;
        url = "https://raw.githubusercontent.com/anudeepND/whitelist/master/domains/optional-list.txt";
        id = 1;
      }
    ];
  };
}
