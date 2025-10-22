{ inputs, pkgs, ... }:
{
  imports = [ inputs.stylix.homeModules.stylix ];
  stylix = {
    enable = true;
    autoEnable = false;
    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-dark.yaml";
    fonts = {
      monospace = {
        name = "Maple Mono NF";
        package = pkgs.maple-mono.NF;
      };
      serif = {
        name = "Noto Serif";
        package = pkgs.noto-fonts;
      };
      sansSerif = {
        name = "Noto Sans";
        package = pkgs.noto-fonts;
      };
      emoji = {
        name = "Twitter Color Emoji";
        package = pkgs.twitter-color-emoji;
      };
      sizes = {
        applications = 12;
        desktop = 12;
        popups = 12;
        terminal = 12;
      };
    };
    cursor = {
      name = "Bibata-Modern-Classic";
      package = pkgs.bibata-cursors;
      size = 24;
    };
    opacity = {
      terminal = 0.6;
    };
    targets = {
      fontconfig.enable = true;
      gtk.enable = true;
      lazygit.enable = true;
      nushell.enable = true;
      yazi.enable = true;
      zellij.enable = true;
      bat.enable = true;
    };
  };
}
