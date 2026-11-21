{config, inputs, ... }:

{
  flake.nixosConfigurations.pc =
    inputs.nixpkgs.lib.nixosSystem {
      system = "x85_64-linux";
      specialArgs = {
        inherit inputs;
      };
      modules = with config.flake.modules.nixos; [
        #Harware
	./_hardware.nix
	#Disko
	./_disko.nix
	inputs.disko.nixosModules.disko
	#System
	system
	programs
	user_bigschniff
	nvidia

	#Home Manager
	inputs.home-manager.nixosModules.home-manager
	{
	  home-manager = {
	    useGlobalPkgs = true;
	    useUserPackages = true;
	    extraSpecialArgs = { 
	      wallpapers = inputs.wallpapers;
	    };
	    users.bigschniff = {
	      imports = with config.flake.modules.homeManager; [
		desktop
		programs
	      ];
	      home.stateVersion = "26.05";
	    };

	  };
	  #System Version
	  system.stateVersion="26.05";
	  #Host Name
	  networking.hostName = "pc";
	}
      ];
    };
}
