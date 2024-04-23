{pkgs, ...}: {
  programs.yazi.settings = {
    open.rules = [
      {
        mime = "text/*";
        use = ["edit" "reveal"];
      }
      {
        mime = "image/*";
        use = ["image" "reveal"];
      }
      {
        mime = "video/*";
        use = ["play" "reveal"];
      }
      {
        mime = "application/json";
        use = ["edit" "reveal"];
      }
      {
        mime = "*";
        use = ["edit" "open" "reveal"];
      }
    ];
    opener = {
      text = [
        {
          run = ''hx "$@" '';
          for = "linux";
        }
      ];
      image = [
        {
          run = ''imv "$@" '';
          block = true;
          for = "linux";
        }
      ];
      video = [
        {
          run = ''mpv "$@" '';
          block = true;
          for = "linux";
        }
      ];
      reveal = [
        {
          run = ''${pkgs.exiftool}/bin/exiftool "$1";'';
          block = true;
        }
      ];
    };
  };
}
