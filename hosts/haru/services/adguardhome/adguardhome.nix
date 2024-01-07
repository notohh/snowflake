_: {
  imports = [
    ./filters.nix
    ./rewrites.nix
  ];
  networking.firewall.allowedTCPPorts = [53 443 80 3000];
  networking.firewall.allowedUDPPorts = [53];
  services.adguardhome = {
    enable = true;
    openFirewall = true;
    mutableSettings = true;
    settings = {
      bind_port = 3000;
      bind_host = "0.0.0.0";
      statistics = {
        enabled = true;
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
