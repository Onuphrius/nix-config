{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "Onuphrius";
    userEmail = "lukatowu@gmail.com";
  };
}
