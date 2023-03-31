{
  pkgs,
  ...
}: {
  
  fonts = {
    enableDefaultFonts = false;
    fontDir.enable = true;
    fonts = with pkgs; [
      inter
      jetbrains-mono
      nerdfonts
      noto-fonts-cjk-sans
      twemoji-color-font
      font-awesome
      fira-code-symbols
      kochi-substitute
      ipafont
    ];

    fontconfig = {
      enable = true;
      allowBitmaps = true;
      defaultFonts = {
        monospace = ["JetBrainsMono Nerd Font"];
        sansSerif = ["Noto Sans" "Noto Color Emoji"];
        emoji = ["Twitter Color Emoji"];
      };
      
      hinting.style = "hintfull";
    
    };
  };
}
