{lib, ...}: {
  networking.firewall.allowedTCPPorts = [8888];
  services.atuin = {
    enable = true;
    openRegistration = true;
    openFirewall = true;
    host = "100.104.42.96";
    port = 8888;
    database = {
      createLocally = lib.mkForce false;
      uri = "postgres://atuin:atuin@100.94.214.100:5432/atuin";
    };
  };
}
