{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ./networking.nix
  ];

  environment.systemPackages = with pkgs; [
    git
    croc
    helix
  ];

  boot.cleanTmpDir = true;
  zramSwap.enable = true;
  networking.hostName = "sora";
  networking.domain = "";
  services.openssh.enable = true;
  users.users.notoh.openssh.authorizedKeys.keys = [
    ''ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDqTg12niJ4nkm7jv9bcfiALJ7YA8LhmSpaq035fY/cU1vTrrfJjnilSgIE69IoC+gBxKWly01S9f4RpF0n7BoYx+GopFP99K8D8koaPL5dku7PCRrWBbu/5ZrMhjNrHvQkse36mTcNGgouorhShuJ9LpWF2oBqkKjzLWKnjU3NRJwCUJFizR3thfc2Hri61vxQGt1WQJrqDPZpUnLL6WAeJK/aHOhMOMLbfEPrtmmBse+xtwFFV+jxEY4MitvgnweQ5i7yKqtrldKQ0o03AO3NRikeQbRmEm6zlHTQpd6EOktTKOJKZYtOZ1ASHPxp8B10B0MBVpYWrvCmb+vyrWszYKeCyuu6a57gfoai+AHNEyxrtT2diJANia4WgW8kHGxuVAXFpKX/tr5ZvGXq8uWlQUgrAHphlaEF+x97aqi8GuZTqq5Y9xH4iwm6V8EK3VvLWTwyQauCq7IypxlNsyj8hUo9TtYQaIHHt1kNFahXLKnIuqmdVq6TGYt9AuK5Zek=''
  ];
}
