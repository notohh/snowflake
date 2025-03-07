_: {
  services.immich-public-proxy = {
    enable = true;
    port = 2284;
    openFirewall = true;
    immichUrl = "https://immich.internal.flake.sh";
  };
}
