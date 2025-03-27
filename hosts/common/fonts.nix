{pkgs, ...}: {
  fonts = {
    enableDefaultPackages = false;
    fontDir.enable = true;
    packages = with pkgs; [
      corefonts
      nerd-fonts.jetbrains-mono
      noto-fonts
      noto-fonts-cjk-sans
      twitter-color-emoji
      maple-mono.NF
    ];

    fontconfig = {
      enable = true;
      allowBitmaps = true;
      defaultFonts = {
        monospace = ["Maple Mono NF" "Twitter Color Emoji"];
        serif = ["Noto Serif" "Twitter Color Emoji"];
        sansSerif = ["Noto Sans" "Twitter Color Emoji"];
        emoji = ["Twitter Color Emoji"];
      };
      hinting = {
        enable = true;
        style = "full";
      };
    };
  };
}
