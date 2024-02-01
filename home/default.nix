{pkgs, ...}: {
  imports = [
    ./helix
    ./neofetch
    ./nushell
    ./starship
    ./lazygit
    ./yazi
  ];

  home.packages = with pkgs; [
    wget
    croc
    eza
    eva
    fd
    du-dust
    bottom
    gnupg
    ripgrep
    lazydocker
    yt-dlp
    nfs-utils
    dig
    tailspin
    nitch
    unzip
    unrar
    p7zip
  ];

  services = {
    gpg-agent = {
      enable = true;
      defaultCacheTtl = 3600;
      pinentryFlavor = "curses";
      enableSshSupport = true;
      enableNushellIntegration = true;
    };
  };

  programs = {
    bat.enable = true;
    git = {
      enable = true;
      delta.enable = true;
      userEmail = "github@notohh.dev";
      userName = "notohh";
      signing = {
        key = "BD47506D475EE86D";
        signByDefault = true;
      };
      ignores = ["*result*" ".direnv" "node_modules"];
    };
    gh = {
      enable = true;
      gitCredentialHelper.enable = true;
      settings = {
        editor = "hx";
        prompt = "enabled";
      };
    };
    direnv = {
      enable = true;
      enableNushellIntegration = true;
      nix-direnv.enable = true;
    };
    zoxide = {
      enable = true;
      enableNushellIntegration = true;
      options = ["--cmd cdd"];
    };
  };
}
