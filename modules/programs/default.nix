{ config, ... }:

{
  flake.modules.nixos.programs = {
    imports = with config.flake.modules.nixos; [
      steam
    ];
  };

  flake.modules.homeManager.programs = {
    imports = with config.flake.modules.homeManager; [
      kitty
    ];
  };
}
