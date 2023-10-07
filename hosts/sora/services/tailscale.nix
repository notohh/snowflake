{
  config,
  lib,
  pkgs,
  ...
}: {
  sops.secrets.tsauth-sora = {};
  environment.systemPackages = [pkgs.jq pkgs.tailscale];
  services.tailscale = {
    useRoutingFeatures = lib.mkDefault "server"; # important to make it a server, it sets sysctl for ip forwarding without intervention and reboot
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
      ${tailscale}/bin/tailscale up --authkey file:${config.sops.secrets.tsauth-sora.path} --advertise-exit-node=true --accept-dns=false
    '';
  };
}
