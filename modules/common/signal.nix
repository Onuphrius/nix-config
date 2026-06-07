{pkgs, ... }:
{    
  home.packages = (with pkgs; [
    signal-desktop
  ]);

  #home.file.".config/Signal/ephemeral.json".text = 
#  ''
#{
#  "localeOverride": null,
#  "system-tray-setting": "DoNotUseSystemTray",
#  "spell-check": true,
#  "theme-setting": "dark",
#  "window": {
#    "autoHideMenuBar": true,
#  }
#}
#
#'';

}
