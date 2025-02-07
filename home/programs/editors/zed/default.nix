{pkgs, ...}: {
  imports = [./usersettings.nix ./userkeymap.nix];
  programs.zed-editor = {
    enable = false;
    package = pkgs.zed-editor.fhsWithPackages (pkgs: [pkgs.zlib pkgs.openssl]);
    extensions = [
      "html"
      "catppuccin"
      "toml"
      "git-firefly"
      "latex"
      "svelte"
      "scss"
      "nix"
      "env"
      "discord-presence"
      "wakatime"
      "nu"
      "gosum"
    ];
  };
}
