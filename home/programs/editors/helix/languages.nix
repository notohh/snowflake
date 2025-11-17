{
  pkgs,
  lib,
  ...
}:
{
  programs.helix.languages = {
    language = with pkgs; [
      {
        name = "nix";
        auto-format = true;
        language-servers = [
          "nil"
        ];
        formatter = {
          command = lib.getExe nixfmt;
          args = [ "-q" ];
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
          args = [
            "--edition"
            "2021"
          ];
        };
      }
      {
        name = "lua";
        auto-format = true;
        language-servers = [
          "lua-language-server"
        ];
        formatter = {
          command = lib.getExe stylua;
        };
      }
      {
        name = "python";
        auto-format = true;
        language-servers = [
          "ruff"
        ];
        formatter = with pkgs; {
          command = lib.getExe ruff;
          args = [
            "format"
            "-q"
          ];
        };
      }
      {
        name = "typescript";
        auto-format = true;
        language-servers = [
          {
            name = "typescript-language-server";
            except-features = [ "format" ];
          }
        ];
        formatter = with pkgs; {
          command = lib.getExe deno;
          args = [
            "fmt"
            "-"
            "--ext"
            "ts"
          ];
        };
      }
      {
        name = "toml";
        auto-format = true;
        language-servers = [
          "taplo"
        ];
        formatter = with pkgs; {
          command = lib.getExe taplo;
          args = [
            "fmt"
            "-"
          ];
        };
      }
      {
        name = "json";
        auto-format = true;
        language-servers = [
          "biome"
        ];
        formatter = with pkgs; {
          command = lib.getExe biome;
          args = [ "format" ];
        };
      }
    ];
    language-server = with pkgs; {
      rust-analyzer.config = {
        checkOnSave.command = "clippy";
        inlayHints = {
          closingBraceHints.enable = false;
          parameterHints.enable = false;
          typeHints.enable = true;
        };
      };
      nil = {
        command = lib.getExe nil;
      };
      typescript-language-server = with pkgs.nodePackages; {
        command = lib.getExe typescript-language-server;
        args = [ "--stdio" ];
      };
      lua = {
        command = lib.getExe lua-language-server;
      };
      taplo = {
        command = lib.getExe taplo;
        args = [
          "lsp"
          "stdio"
        ];
      };
      ruff = {
        command = lib.getExe ruff;
        args = [
          "server"
          "--preview"
        ];
      };
    };
  };
}
