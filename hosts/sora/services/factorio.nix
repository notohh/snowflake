{ pkgs, ... }:
{
  services.factorio = {
    enable = true;
    package = pkgs.factorio-headless;
    public = false;
    lan = false;
    openFirewall = true;
    admins = [ "notoh" ];
    game-name = "forsen";
    autosave-interval = 20;
  };
}
