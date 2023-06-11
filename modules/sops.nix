_: {
  sops = {
    defaultSopsFile = ../secrets/secrets.yaml;
    age.keyFile = "/home/notoh/.config/sops/age/keys.txt";
  };
}
