_: {
  home.file.".local/bin/lock" = {
    executable = true;
    text = ''
      swayidle -w \
         timeout 500 'swaylock -f --image ~/Pictures/wallpapers/mumei.png --clock --grace 5 --ring-color f5c2e7 --inside-color 1e1e2e --line-color 11111b' \
         timeout 600 'hyprctl dispatch dpms off' \
             resume 'hyprctl dispatch dpms on' \
         before-sleep 'swaylock -f --image ~/Picture/wallpapers/mumei.png --clock --ring-color f5c2e7 --inside-color 1e1e2e --line-color 11111b' \
         after-resume 'ironbar reload'
    '';
  };
}
