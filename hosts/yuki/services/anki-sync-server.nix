{config, ...}: {
  sops.secrets.anki-pwd = {};
  services.anki-sync-server = {
    enable = true;
    openFirewall = true;
    address = "0.0.0.0";
    port = 27701;
    users = [
      {
        username = "notoh";
        passwordFile = config.sops.secrets.anki-pwd.path;
      }
    ];
  };
}
