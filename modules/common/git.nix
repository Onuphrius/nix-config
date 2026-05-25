{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    settings.user = {
      name = "Onuphrius";
      Email = "lukatowu@gmail.com";
    };
  };
}
