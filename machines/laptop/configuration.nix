{ pkgs, ... }:


{
  imports = [
    ./hardware.nix
    ../../modules/nixos
  ];
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;
  # Networking
  networking.hostName = "lsd";
  networking.networkmanager.enable = true;

  # Users
  users.users.lsd = {
    isNormalUser = true;
    description = "lsd";
    extraGroups = [ "networkmanager" "wheel" ];
    openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEwjaEC3NMfbKZ+YTTmcjUBUiqRLZZZJz8vuaODEmE8F bigschiff@pc"
    ];
  };
  
  security.polkit.enable = true;

  # SSH
  services.openssh = {                                                                       
    enable = true;                                                                  
    settings.PasswordAuthentication = false;                                                 
  };

  services.dbus.enable = true;
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
	command = ''${pkgs.tuigreet}/bin/tuigreet \
          --time \
          --cmd ${pkgs.swayfx}/bin/sway'';
	user = "greeter";

      };
    };
  };
  # System version
  system.stateVersion = "26.05";
}
