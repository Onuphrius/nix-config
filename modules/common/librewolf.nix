{pkgs, ...}:
{
  programs.librewolf = {
    enable = true;
    #about:policies#documentation
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
      BlockAboutSupport             = false;

      # UI and Behavior
      DisplayBookmarksToolbar 	    = "never";
      DisplayMenuBar                = "never";
      DontCheckDefaultBrowser       = true;
      OfferToSaveLogins             = false;

    #about:support for extensions
      ExtensionSettings = let 
	moz = short: "https://addons.mozilla.org/firefox/downloads/latest/${short}/latest.xpi";
      in {
	"446900e4-71c2-419f-a6a7-df9c091e268b" = {
	  install_url = moz "446900e4-71c2-419f-a6a7-df9c091e268b";
	  installation_mode = "force_installed";
	};
	"74145f27-f039-47ce-a470-a662b129930a" = {
	  install_url = moz "74145f27-f039-47ce-a470-a662b129930a";
	  installation_mode = "force_installed";
	};
      };
    };
    #about:config for Preferences
    profiles."default" = {
      search.default = "ddg";
      search.force = true;
      search.privateDefault = "ddg";
      settings = {
	"extensions.activeThemeID" = "firefox-compact-dark@mozilla.org";
      };
    };

  };
}
