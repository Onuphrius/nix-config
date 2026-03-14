{ config, pkgs, ... }:
{
  programs.rmpc = {
    enable = true;
    config = builtins.readFile ./config/rmpc/config.ron;
  };
  xdg.configFile."rmpc/themes/default.ron".source = ./config/rmpc/theme.ron;
}
