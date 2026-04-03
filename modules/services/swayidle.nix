{ config, pkgs, ... }:


{
  services.swayidle = {
    enable = true;
    timeouts = 
    [
      { timeout = 300; command="${pkgs.hyprlock}/bin/hyprlock --grace 3";}
    ];
  };
}
