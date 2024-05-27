{
  pkgs,
  lib,
  ...
}: {
  home.packages = [(pkgs.callPackage ../../../../pkgs/scls {})];
  programs.helix.languages = {
    language = with pkgs; [
      {
        name = "nix";
        auto-format = true;
        language-servers = ["scls" "nil"];
        formatter = {
          command = lib.getExe alejandra;
          args = ["-q"];
        };
      }
      {
        name = "rust";
        auto-format = true;
        language-servers = ["scls" "rust-analyzer"];
        formatter = {
          command = lib.getExe rustfmt;
          args = ["--edition" "2021"];
        };
      }
      {
        name = "lua";
        auto-format = true;
        language-servers = ["scls" "lua-language-server"];
        formatter = {
          command = lib.getExe stylua;
        };
      }
      {
        name = "python";
        auto-format = true;
        language-servers = ["scls" "ruff"];
        formatter = with pkgs; {
          command = lib.getExe ruff;
          args = ["format" "-q"];
        };
      }
      {
        name = "javascript";
        auto-format = true;
        language-servers = [
          "scls"
          {
            name = "typescript-language-server";
            except-features = ["format"];
          }
        ];
        formatter = with pkgs; {
          command = lib.getExe biome;
          args = ["format"];
        };
      }
      {
        name = "toml";
        auto-format = true;
        language-servers = ["scls" "taplo"];
        formatter = with pkgs; {
          command = lib.getExe taplo;
          args = ["fmt" "-"];
        };
      }
      {
        name = "json";
        auto-format = true;
        language-servers = ["scls" "biome"];
        formatter = with pkgs; {
          command = lib.getExe biome;
          args = ["format"];
        };
      }
    ];
    language-server = with pkgs; {
      scls = {
        command = "simple-completion-language-server";
        config = {
          feature_snippets = true;
          feature_paths = true;
        };
      };
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
      lua = {
        command = lib.getExe lua-language-server;
      };
      taplo = {
        command = lib.getExe taplo;
        args = ["lsp" "stdio"];
      };
      ruff = {
        command = lib.getExe ruff;
        args = ["server" "--preview"];
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
