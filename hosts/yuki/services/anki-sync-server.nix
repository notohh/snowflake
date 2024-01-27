{config, ...}: {
  sops.secrets.anki-pwd = {};
  services.anki-sync-server = {
    enable = true;
    openFirewall = true;
    address = "100.108.113.89";
    port = 27701;
    users = [
      {
        username = "notoh";
        passwordFile = config.sops.secrets.anki-pwd.path;
      }
    ];
  };
}
