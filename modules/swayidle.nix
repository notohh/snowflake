_: {
  home.file.".local/bin/lock" = {
    executable = true;
    text = ''
      swayidle -w \
         timeout 600 'swaylock -f --image ~/Pictures/wallpapers/anny.jpg --clock --grace 5 --ring-color f5c2e7 --inside-color 1e1e2e --line-color 11111b' \
         timeout 800 'hyprctl dispatch dpms off' \
             resume 'hyprctl dispatch dpms on' \
         before-sleep 'swaylock -f --image ~/Picture/wallpapers/anny.jpg --clock --ring-color f5c2e7 --inside-color 1e1e2e --line-color 11111b'
    '';
  };
}
