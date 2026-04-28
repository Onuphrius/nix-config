{config, pkgs, ... }:

{
  services.octoprint = {
    enable = true;
    port = 5000;
    openFirewall = false;

  };
}
