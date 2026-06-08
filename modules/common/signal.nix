{pkgs, ... }:
{    
  home.packages = (with pkgs; [
    signal-desktop
  ]);

  home.file.".config/Signal/ephemeral.json".force = true;
  
  home.file.".config/Signal/ephemeral.json".text = 
  ''
{
  "localeOverride": null,
  "system-tray-setting": "DoNotUseSystemTray",
  "spell-check": true,
  "theme-setting": "dark",
  "window": {
    "maximized": false,
    "autoHideMenuBar": false,
    "fullscreen": false,
    "width": 1896,
    "height": 1013,
    "x": 0,
    "y": 0
  }
}
  '';

}
