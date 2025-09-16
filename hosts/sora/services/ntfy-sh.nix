{ pkgs, ... }:
{
  environment.systemPackages = [ pkgs.ntfy-sh ];
  services.ntfy-sh = {
    enable = true;
    settings = {
      listen-http = ":8090";
      base-url = "https://ntfy.flake.sh";
      upstream-base-url = "https://ntfy.sh";
      behind-proxy = true;
      auth-default-access = "read-only";
    };
  };
}
