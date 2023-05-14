{config, ...}: {
  sops = {
    defaultSopsFile = ../secrets/secrets.yaml;
    age.keyFile = "/home/notoh/.config/sops/age/keys.txt";
    secrets.foundry-username = {};
    secrets.foundry-password = {};
    secrets.cloudflare-api-key = {};
  };
}
