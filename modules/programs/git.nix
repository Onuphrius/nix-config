{
  flake.modules.homeManager.git = {
    programs.git = {
      enable = true;
      settings.user = {
	name = "Onuphrius";
	Email = "lukatowu@gmail.com";
      };
    };
  };
}
