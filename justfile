set shell := ["nu", "-c"]

default:
  @just --list\

up:
  nix flake update

upp input:
  nix flake update {{input}}

switch:
  nh os switch .

build:
  nh os boot .

repl:
  nix repl -f flake:nixpkgs

  