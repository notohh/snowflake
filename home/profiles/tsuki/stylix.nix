{
  inputs,
  pkgs,
  ...
}: {
  imports = [inputs.stylix.homeManagerModules.stylix];

  stylix = {
    autoEnable = false;
    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-dark.yaml";
    fonts = {
      monospace = {
        name = "JetBrainsMono NF Medium";
        package = pkgs.nerdfonts;
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
        applications = 10;
        desktop = 10;
        popups = 10;
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
      mako.enable = true;
      lazygit.enable = true;
      nushell.enable = true;
      yazi.enable = true;
      zellij.enable = true;
      bat.enable = true;
    };
  };
}
