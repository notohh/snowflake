{config, ...}: {
  imports = [
    ./filters.nix
    ./rewrites.nix
  ];
  sops.secrets.nextdns = {owner = "adguardhome";};

  users.users.adguardhome = {
    isSystemUser = true;
    group = "adguardhome";
  };
  users.groups.adguardhome = {};

  networking.firewall.allowedTCPPorts = [53 3000];
  networking.firewall.allowedUDPPorts = [53];

  services.adguardhome = {
    enable = true;
    openFirewall = true;
    mutableSettings = true;
    settings = {
      bind_port = 3000;
      bind_host = "192.168.1.103";
      os = {
        user = "adguardhome";
        group = "adguardhome";
      };
      dns = {
        upstream_dns_file = config.sops.secrets.nextdns.path;
        enable_dnssec = true;
        cache_optimistic = true;
      };
      statistics = {
        enabled = true;
        interval = "336h";
        ignored = [
          "youporn.com"
          "pornhub.com"
          "xvideos.com"
          "onlyfans.com"
          "fansly.com"
        ];
      };
    };
  };
}
