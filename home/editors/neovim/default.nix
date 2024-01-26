{pkgs, ...}: {
  home.packages = [pkgs.lunarvim];
  xdg.configFile."lvim/config.lua".source = ./config.lua;
  xdg.configFile."lvim/lua/user/presence.lua".source = ./lua/presence.lua;
}
