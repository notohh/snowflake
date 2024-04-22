{
  inputs,
  pkgs,
  lib,
  ...
}: let
  compileSCSS = name: source: "${pkgs.runCommandLocal name {} ''
    mkdir -p $out
    ${lib.getExe pkgs.sass} '${source}' > $out/${name}.css
  ''}/${name}.css";
in {
  imports = [inputs.ironbar.homeManagerModules.default ./config.nix];

  programs.ironbar = {
    enable = true;
    systemd = true;
    style = builtins.readFile (compileSCSS "style" ./style.scss);
  };
}
