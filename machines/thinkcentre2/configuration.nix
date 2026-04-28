{ config, pkgs, ... }:


{
  imports = [
    ./hardware.nix
    ./disko.nix
  ];
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  networking.hostName = "think2";
  networking.networkmanager.enable = true;

  # Timezone
  time.timeZone = "Europe/Berlin";
  console.keyMap = "de-latin1-nodeadkeys";

  # Users
  users.users.lab= {
    isNormalUser = true;
    description = "lab";
    extraGroups = [ "networkmanager" "wheel" ];
    openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEwjaEC3NMfbKZ+YTTmcjUBUiqRLZZZJz8vuaODEmE8F bigschiff@pc"
    ];
  };

  # SSH
  services.openssh = {                                                                       
    enable = true;                                                                  
    settings.PasswordAuthentication = false;                                                 
    settings.PermitRootLogin = "no";
  };

  #Networking
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 22 ];
  };

  environment.systemPackages = with pkgs; [
    git
  ];

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  system.autoUpgrade = {
    enable = true;
    allowReboot = false;
  };
  
  # System version
  system.stateVersion = "25.11";
}
