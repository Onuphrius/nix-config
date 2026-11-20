{ config, ... }:

{
  flake.modules.nixos.programs = {
    imports = with config.flake.modules.nixos; [
      steam
      mullvad
    ];
  };

  flake.modules.homeManager.programs = {
    imports = with config.flake.modules.homeManager; [
      kitty
      shell
      neovim
      git
      librewolf
    ];
  };
}
