{
  inputs,
  self,
  ...
}: {
  imports = [
    inputs.nix-topology.flakeModule
  ];
  perSystem = _: {
    topology.modules = [
      {inherit (self) nixosConfigurations;}
      ({config, ...}: let
        inherit
          (config.lib.topology)
          mkConnection
          mkInternet
          mkRouter
          ;
      in {
        networks = {
          home = {
            name = "home";
            cidrv4 = "192.168.0.0/24";
          };
          tailscale0 = {
            name = "tailscale";
            cidrv4 = "100.0.0.0/32";
          };
          hetzner = {
            name = "hetzner";
            cidrv4 = "5.161.102.107/24";
          };
        };

        nodes = {
          internet = mkInternet {
            connections = [
              (mkConnection "hetzner" "wan0")
              (mkConnection "router" "lan0")
            ];
          };
          router = mkRouter "UDM-SE" {
            info = "UDM-SE";
            interfaceGroups = [
              [
                "eth0"
                "eth1"
                "eth2"
                "eth4"
                "eth5"
                "eth6"
                "eth7"
              ]
              ["lan0"]
            ];
            connections = {
              eth0 = mkConnection "ame" "home";
              eth1 = mkConnection "arashi" "home";
              eth2 = mkConnection "haru" "home";
              eth3 = mkConnection "kariru" "home";
              eth4 = mkConnection "sakura" "home";
              eth5 = mkConnection "tsuki" "home";
              eth6 = mkConnection "tsuru" "home";
              eth7 = mkConnection "yuki" "home";
            };
          };
          hetzner = mkRouter "Hetzner" {
            info = "hetzner edge router";
            interfaceGroups = [
              [
                "eth0"
                "eth1"
              ]
              ["wan0"]
            ];
            connections = {
              eth0 = mkConnection "sora" "eth0";
              eth1 = mkConnection "kaze" "eth0";
            };
          };
        };
      })
    ];
  };
}
