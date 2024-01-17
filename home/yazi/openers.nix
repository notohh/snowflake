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
          exec = ''hx "$@"'';
          for = "linux";
        }
      ];
      image = [
        {
          exec = ''imv "$@" '';
          block = true;
          for = "linux";
        }
      ];
      video = [
        {
          exec = ''mpv "$@"'';
          block = true;
          for = "linux";
        }
      ];
      reveal = [
        {
          exec = ''${pkgs.exiftool}/bin/exiftool "$1";'';
          block = true;
        }
      ];
    };
  };
}
