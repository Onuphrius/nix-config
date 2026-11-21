{
  flake.modules.nixos.tuigreet = {pkgs, ...}:{
    services.greetd = {
      enable = true;
      settings = {
	command = ''${pkgs.tuigreet}/bin/tuigreet --time --cmd "${pkgs.swayfx}/bin/sway --unsupported-gpu"'';
	user = "greeter";
      };
    };
  };
}
