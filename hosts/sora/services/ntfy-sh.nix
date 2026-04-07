{ pkgs, ... }:
{
  environment.systemPackages = [ pkgs.ntfy-sh ];
  services.ntfy-sh = {
    enable = true;
    settings =
      let
        listenAddr = ":8090";
      in
      {
        listen-http = listenAddr;
        base-url = "https://ntfy.flake.sh";
        upstream-base-url = "https://ntfy.sh";
        behind-proxy = true;
        auth-default-access = "read-only";
      };
  };
}
