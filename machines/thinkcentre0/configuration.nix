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
  networking.hostName = "think0";
  networking.networkmanager.enable = true;

  # Timezone
  time.timeZone = "Europe/Berlin";
  console.keyMap = "de-latin1-nodeadkeys";
  virtualisation.vmVariant = {
    virtualisation.qemu.options = [
      "-netdev user,id=net0,hostfwd=tcp::2222-:22"
      "-device virtio-net-pci,netdev=net0"
    ];
  };
  # Users
  users.users.lab= {
    isNormalUser = true;
    description = "lab";
    extraGroups = [ "networkmanager" "wheel" ];
    openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEwjaEC3NMfbKZ+YTTmcjUBUiqRLZZZJz8vuaODEmE8F bigschiff@pc"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINiDirxjF7ZB0t86LrtS0M2GsGGf+CmkI0KQHKiWg4oQ lsd@nixos"
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
