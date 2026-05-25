{ config, pkgs, ... }:

{
  programs.librewolf = {
    enable = true;
    policies = {
      DisableFirefoxStudies         = true;
      DisableFirefoxAccounts        = true;
      DisableFirefoxScreenshots     = true;
      DisableForgetButton           = true;
      DisableMasterPasswordCreation = true;
      DisableProfileImport          = true;
      DisableProfileRefresh         = true;
      DisableSetDesktopBackground   = true;
      DisablePocket                 = true;
      DisableTelemetry              = true;
      DisableFormHistory            = true;
      DisablePasswordReveal         = true;
      BlockAboutConfig              = false;
      BlockAboutProfiles            = true;
      BlockAboutSupport             = true;

      # UI and Behavior
      DisplayMenuBar                = "never";
      DontCheckDefaultBrowser       = true;
      OfferToSaveLogins             = false;

    };
    profiles."default" = {
      search.default = "ddg";
      search.force = true;
      search.privateDefault = "ddg";
    };

  };
}
