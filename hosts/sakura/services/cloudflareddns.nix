_: {
  sops.secrets.cloudflareddns = {};
  virtualisation.oci-containers.containers.cloudflareddns = {
    image = "oznu/cloudflare-ddns";
    environmentFiles = [
      /run/secrets/cloudflareddns
    ];
  };
}
