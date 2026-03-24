{ config, pkgs, ... }:


{
  services.swayidle = {
    enable = true;
    timeouts = 
    [
      { timeout = 180; command="${pkgs.hyprlock}/bin/hyprlock --grace 3";}
      { timeout = 300; command = "${pkgs.systemd}/bin/systemctl suspend"; }
    ];
  };
}
