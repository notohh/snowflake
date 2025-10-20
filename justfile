set shell := ["nu", "-c"]

default:
  @just --list\

up:
  nix flake update

upp input:
  nix flake update {{input}}

sw:
  nh os switch .

bu:
  nh os boot .

repl:
  nix repl -f flake:nixpkgs

vuln:
	nix run github:nix-community/vulnix -- --system --json | nix run nixpkgs#jq '.[] .name'