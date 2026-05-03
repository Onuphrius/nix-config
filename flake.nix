#TODO
# Neovim colors
# Notifications: Mako
# Rofi Clipboard Manager
# GTK Theme
# Media Control: playerctl
# Network Manager: Gazelle
# Bluetooth: bluez, bluetuith
{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    #TODO
    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";
    wallpapers = {
      url = "github:Onuphrius/wallpapers";
      flake = false; # treat as a simple git repo
    };
  };

  outputs = inputs@{self, nixpkgs, home-manager, wallpapers, ... }: {
    nixosConfigurations = {

      pc = nixpkgs.lib.nixosSystem {
	modules = [
          ./machines/pc/configuration.nix
	  inputs.disko.nixosModules.disko

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
	    home-manager.users.bigschniff = import ./machines/pc/home.nix;
	    home-manager.extraSpecialArgs = {
		wallpapers = inputs.wallpapers;
	    };
            # Optionally, use home-manager.extraSpecialArgs to pass arguments to home.nix
	  }
        ];

      };
      laptop = nixpkgs.lib.nixosSystem {
        modules = [
          ./machines/laptop/configuration.nix

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
	    home-manager.users.lsd = import ./machines/laptop/home.nix;
	    home-manager.extraSpecialArgs = {
		wallpapers = inputs.wallpapers;
	    };
            # Optionally, use home-manager.extraSpecialArgs to pass arguments to home.nix
	  }
        ];
      };
      thinkcentre0 = nixpkgs.lib.nixosSystem {
	modules = [
	  ./machines/thinkcentre0/configuration.nix
	  inputs.disko.nixosModules.disko
	];
      };
      thinkcentre1 = nixpkgs.lib.nixosSystem {
	modules = [
	  ./machines/thinkcentre1/configuration.nix
	  inputs.disko.nixosModules.disko
	];
      };
      thinkcentre2 = nixpkgs.lib.nixosSystem {
	modules = [
	  ./machines/thinkcentre2/configuration.nix
	  inputs.disko.nixosModules.disko
	];
      };


      installer = nixpkgs.lib.nixosSystem {
	system = "x86_64-linux";
	modules = [
	  "${nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix"
	  ./iso/minimal.nix
	];
      };
    };

    packages."x86_64-linux".iso = self.nixosConfigurations.installer.config.system.build.isoImage;
  };
}
