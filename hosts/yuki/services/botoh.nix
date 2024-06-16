{inputs, ...}: {
  imports = [inputs.botoh.nixosModules.default];
  sops.secrets = {
    twitch_auth = {};
  };
  services.botoh = {
    enable = true;
    log_level = "info";
    environmentFiles = ["/run/secrets/twitch_auth"];
  };
}
