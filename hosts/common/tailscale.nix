{
  pkgs,
  ...
}: {
  services.tailscale = {
    enable = true;
  };
}
