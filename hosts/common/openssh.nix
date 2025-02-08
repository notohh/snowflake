{lib, ...}: {
  services.openssh = {
    enable = true;
    settings = {
      KbdInteractiveAuthentication = false;
      PasswordAuthentication = lib.mkForce false;
      PubkeyAuthentication = lib.mkForce true;
      PermitRootLogin = lib.mkForce "yes";
      StreamLocalBindUnlink = "yes";
      GatewayPorts = "clientspecified";
    };
    hostKeys = [
      {
        path = "/etc/ssh/ssh_host_ed25519_key";
        type = "ed25519";
      }
    ];
  };
}
