{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    # home-manager, used for managing user configuration
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      # The `follows` keyword in inputs is used for inheritance.
      # Here, `inputs.nixpkgs` of home-manager is kept consistent with
      # the `inputs.nixpkgs` of the current flake,
      # to avoid problems caused by different versions of nixpkgs.
      inputs.nixpkgs.follows = "nixpkgs";
    };
    wallpapers = {
      url = "github:Onuphrius/wallpapers";
      flake = false; # treat as a simple git repo
    };
  };

  outputs = inputs@{ nixpkgs, home-manager, wallpapers, ... }: {
    nixosConfigurations = {
      laptop = nixpkgs.lib.nixosSystem {
        modules = [
          ./hosts/laptop/configuration.nix

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
    };
    packages.x86_64-linux.iso =
      (nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./iso/minimal.nix
        ];
      }).config.system.build.isoImage;
  };
}
