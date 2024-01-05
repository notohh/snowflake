{
  config,
  lib,
  pkgs,
  ...
}: {
  sops.secrets.tsauth-sakura = {
    sopsFile = ../../../secrets/tailscale/secrets.yaml;
  };
  environment.systemPackages = [pkgs.jq pkgs.tailscale];
  services.tailscale = {
    useRoutingFeatures = lib.mkDefault "client";
  };
  networking.firewall.allowedUDPPorts = [config.services.tailscale.port];
  networking.firewall.trustedInterfaces = [config.services.tailscale.interfaceName];

  systemd.services.tailscale-autoconnect = {
    description = "Automatic connection to Tailscale";

    # make sure tailscale is running before trying to connect to tailscale
    after = ["network-pre.target" "tailscale.service"];
    wants = ["network-pre.target" "tailscale.service"];
    wantedBy = ["multi-user.target"];

    # set this service as a oneshot job
    serviceConfig.Type = "oneshot";

    # have the job run this shell script
    script = with pkgs; ''
      # wait for tailscaled to settle
      sleep 2

      # check if we are already authenticated to tailscale
      status="$(${tailscale}/bin/tailscale status -json | ${jq}/bin/jq -r .BackendState)"
      if [ $status = "Running" ]; then # if so, then do nothing
        exit 0
      fi

      # otherwise authenticate with tailscale
      ${tailscale}/bin/tailscale up -authkey file:${config.sops.secrets.tsauth-sakura.path} --exit-node=100.104.42.96 --exit-node-allow-lan-access=true --accept-dns=false
    '';
  };
}
