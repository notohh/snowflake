{pkgs, ...}: {
  imports = [./usersettings.nix ./userkeymap.nix];
  programs.zed-editor = {
    enable = false;
    package = pkgs.zed-editor.fhsWithPackages (pkgs: [pkgs.zlib pkgs.openssl]);
    extensions = [
      # langs
      "html"
      "toml"
      "git-firefly"
      "latex"
      "svelte"
      "scss"
      "nix"
      "nu"
      "gosum"
      "scls"

      # misc
      "env"
      "discord-presence"
      "wakatime"

      # themes
      "catppuccin"
      "material-icon-theme"
    ];
  };
}
