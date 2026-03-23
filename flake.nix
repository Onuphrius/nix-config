#TODO
# Neovim colors
# Notifications: Mako
# Rofi Clipboard Manager
# Rofi Window Switcher
# GTK Theme
# Lock screen
# Media Control: playerctl
# Network Manager: Gazelle
# Bluetooth: bluez, bluetuith
{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
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
      laptop = nixpkgs.lib.nixosSystem {
        modules = [
          ./machines/laptop/configuration.nix

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
	   home-manager.users.lsd = import ./hosts/laptop/home.nix;
	   home-manager.extraSpecialArgs = {
	   	wallpapers = inputs.wallpapers;
	   };
            # Optionally, use home-manager.extraSpecialArgs to pass arguments to home.nix
          
	 }
        ];
      };
      thinkcentre1 = nixpkgs.lib.nixosSystem {
	modules = [
	  ./machines/thinkcentre1/configuration.nix
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
