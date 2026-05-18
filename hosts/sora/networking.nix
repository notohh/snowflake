{ lib, ... }:
{
  networking = {
    hostName = "sora";
    useDHCP = false;
    nameservers = [
      "1.1.1.1"
      "149.112.112.112"
    ];
    usePredictableInterfaceNames = lib.mkForce false;
    interfaces.eth0 = {
      ipv4.addresses = [
        {
          address = "5.161.102.107";
          prefixLength = 32;
        }
      ];
    };

    defaultGateway = {
      address = "172.31.1.1";
      interface = "eth0";
    };
  };
  services.udev.extraRules = ''
    ATTR{address}=="96:00:02:c2:dc:83", NAME="eth0"
  '';
}
