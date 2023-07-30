{pkgs, ...}: {
  fonts = {
    enableDefaultPackages = false;
    fontDir.enable = true;
    packages = with pkgs; [
      corefonts
      jost
      jetbrains-mono
      nerdfonts
      noto-fonts
      noto-fonts-cjk
      twemoji-color-font
      font-awesome
      kochi-substitute
      ipafont
    ];

    fontconfig = {
      enable = true;
      allowBitmaps = true;
      defaultFonts = {
        monospace = ["JetBrainsMono Nerd Font" "Twitter Color Emoji"];
        serif = ["Noto Serif" "Twitter Color Emoji"];
        sansSerif = ["Noto Sans" "Twitter Color Emoji"];
        emoji = ["Twitter Color Emoji"];
      };

      hinting.style = "full";
    };
  };
}
