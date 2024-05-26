{
  pkgs,
  lib,
  ...
}: {
  programs.helix.languages = {
    language = with pkgs; [
      {
        name = "nix";
        auto-format = true;
        formatter = {
          command = lib.getExe alejandra;
          args = ["-q"];
        };
      }
      {
        name = "rust";
        auto-format = true;
        language-servers = [
          "rust-analyzer"
        ];
        formatter = {
          command = lib.getExe rustfmt;
          args = ["--edition" "2021"];
        };
      }
      {
        name = "lua";
        auto-format = true;
        formatter = {
          command = lib.getExe stylua;
        };
      }
    ];
    language-server = with pkgs; {
      nil = {
        command = lib.getExe nil;
      };
      vscode-css-language-server = {
        command = "${nodePackages.vscode-css-languageserver-bin}/bin/css-languageserver";
        args = ["--stdio"];
      };
      typescript-language-server = with pkgs.nodePackages; {
        command = "${typescript-language-server}/bin/typescript-language-server";
        args = ["--stdio"];
      };
      rust-analyzer.config = {
        checkOnSave.command = "clippy";
        inlayHints = {
          closingBraceHints.enable = false;
          parameterHints.enable = false;
          typeHints.enable = true;
        };
      };
    };
  };
}
