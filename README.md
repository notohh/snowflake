<div align="center">
<h1>
<img width="96" src="https://files.artturin.com/files/nixoscolorful.svg"></img> <br>
  snowflake
</h1>
</h2><img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/palette/macchiato.png" width="500" />
<p></p>
  <img src="https://img.shields.io/github/stars/notohh/snowflake?color=f5c2e7&labelColor=303446&style=for-the-badge&logo=starship&logoColor=f5c2e7">
  <img src="https://img.shields.io/github/repo-size/notohh/snowflake?color=fab387&labelColor=303446&style=for-the-badge&logo=github&logoColor=fab387">
  <img src="https://img.shields.io/static/v1.svg?style=for-the-badge&label=License&message=MIT&colorA=313244&colorB=cba6f7&logo=unlicense&logoColor=ca9ee6&"/>
 <p></p>
<img src="https://builtwithnix.org/badge.svg">
<a href="https://ci.flake.sh/repos/9" target="_blank">
  <img src="https://ci.flake.sh/api/badges/9/status.svg" alt="status-badge" />
</a>
 <p></p>
<img src="https://i.imgur.com/z1EFyMr.png"></img>
<p>
  Screenshot updated: 2024-01-15 (bar is a heavy WIP)
</p>
<h4>
  :warning: this config is a constant WIP, 
  and will change constantly as i continue to learn about nix. stuff will be updated, restructed, added, and removed quite often. please also note that everything hosted here is what works best for me,   and could totally be ineffecient, or just a dead wrong way of doing something.</h4>
</div>

## :open_book: Table of contents

+ :house_with_garden: [home](src/branch/master/home)
+ :computer: [hosts](src/branch/master/hosts)
  - :cloud_with_rain: [ame](src/branch/master/hosts/ame)
  - :cloud_with_lightning_and_rain: [arashi](src/branch/master/hosts/arashi)
  - :hibiscus: [haru](src/branch/master/hosts/haru)
  - :satellite: [kariru](src/branch/master/hosts/kariru)
  - :wind_chime: [kaze](src/branch/master/hosts/kaze)
  - :cherry_blossom: [sakura](src/branch/master/hosts/sakura)
  - :milky_way: [sora](src/branch/master/hosts/sora)
  - :full_moon: [tsuki](src/branch/master/hosts/tsuki)
  - :building_construction: [tsuru](src/branch/master/hosts/tsuru)
  - :snowflake: [yuki](src/branch/master/hosts/yuki)
+ :electric_plug: [modules](src/branch/master/modules)
+ :package: [pkgs](src/branch/master/pkgs)
+ :lock: [secrets](src/branch/master/secrets)

## :spiral_notepad: Features

+ multi-config repo, with configs for servers, laptop, and desktop
+ multi-system home-manager setup
+ secrets provisioning with [sops-nix](https://github.com/Mic92/sops-nix)
+ multiple fully declarative self hosted services (and some containerized ones, with a docker backend)
+ wayland config for hyprland
+ custom packages not found in nixpkgs

## :busts_in_silhouette: Credit
#### people who've inspired me to dive into nix, and i've stolen stuff from (you guys are awesome!)
+ [fufexan](https://github.com/fufexan) - a ton of home manager, hyprland stuff, and some gh workflows
+ [Misterio77](https://github.com/Misterio77) - flake, and some other boilerplate
+ [NobbZ](https://github.com/NobbZ) - general nix assistance
+ [MatthiasBenaets](https://github.com/MatthiasBenaets) - amazing nixos introduction video
+ [sioodmy](https://github.com/sioodmy) - general dotfile, readme badges, and hyprland stuff
+ [MatthewCroughan](https://github.com/MatthewCroughan) - traefik config used as reference
+ [seqizz](https://github.com/seqizz/nixos-config/blob/3ee51f406a8c7aa3afde9cdee97a43641b2ed2ef/modules/server/rustypaste.nix) - rustypaste config
+ [Yavko](https://github.com/yavko) - ironbar config used as reference
+ [hlissner](https://github.com/hlissner) - [security.nix](modules/security.nix)
+ [noc](https://git.flake.sh/noc) - networking diagram + a ton of other stuff
