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
  flake.modules.nixos.desktop = {
    import = with config.flake.modules.nixos; [
      tuigreet
    ];
  };
}
