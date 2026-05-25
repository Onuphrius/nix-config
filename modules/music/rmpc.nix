{ config, pkgs, ... }:
{
  programs.rmpc = {
    enable = true;
    config = builtins.readFile ./config/rmpc/config.ron;
  };
  xdg.configFile."rmpc/themes/default.ron".source = ./config/rmpc/theme.ron;

  xdg.desktopEntries =  {
    rmpc = {
      name = "rmpc";
      genericName = "Music Player";
      exec = "rmpc %U";
      terminal = true;
      categories = ["Music" "Player"];
      mimeType=["audio/mpeg" "audio/x-mpegurl" "audio/ogg" "audio/flac"];
    };
  };
}
