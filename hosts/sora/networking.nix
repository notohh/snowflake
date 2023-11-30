{lib, ...}: {
  networking = {
    nameservers = [
      "185.12.64.2"
      "185.12.64.1"
    ];
    defaultGateway = "172.31.1.1";
    defaultGateway6 = {
      address = "";
      interface = "eth0";
    };
    dhcpcd.enable = false;
    usePredictableInterfaceNames = lib.mkForce false;
    interfaces = {
      eth0 = {
        ipv4.addresses = [
          {
            address = "5.161.102.107";
            prefixLength = 32;
          }
        ];
        ipv4.routes = [
          {
            address = "172.31.1.1";
            prefixLength = 32;
          }
        ];
      };
    };
  };
  services.udev.extraRules = ''
    ATTR{address}=="96:00:02:c2:dc:83", NAME="eth0"

  '';
}
