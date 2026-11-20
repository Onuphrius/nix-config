{ config, ... }:

{
  flake.modules.nixos.system = {
    imports = with config.flake.modules.nixos; [
      bootloader
      internationalisation
      networking
      nix
      ssh
    ];
  };
}
