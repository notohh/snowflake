{
  pkgs,
  config,
  ...
}: let
  configDir = "/home/notoh/snowflake/home/programs/ags/config";
in {
  programs.ags = {
    enable = true;
    extraPackages = with pkgs; [libsoup_3 libdbusmenu-gtk3];
  };
  home.packages = with pkgs; [dart-sass bun];
  xdg.configFile = {
    "ags".source = config.lib.file.mkOutOfStoreSymlink "${configDir}";
  };
}
