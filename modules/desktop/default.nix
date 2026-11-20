{ config, ... }:

{
  flake.modules.homeManager.desktop = {
    imports = with config.flake.modules.homeManager; [
      font
      hyprlock
      mako
      rofi
      sway
      swayidle
      waybar
      wlsunset
    ];
  };
}
