{config, pkgs, ...}:
{

  services.mako = {
    enable = true;
    settings = {
      "actionable=true" = {
	anchor = "bottom-right";
      };
      actions = true;
      anchor = "bottom-right";
      default-timeout = 3000;
      markup = true;
      outer-margin = "0,0,10";
      icons = true;
      background-color = "#222222";
      border-color = "#EAEBEA";
      text-color = "#EAEBEA";
    };
  };
}
