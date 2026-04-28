{ pkgs, ... }:


{
  imports = [
    ./hardware.nix
    ./disko.nix
  ];
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;
  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.configurationLimit = 10;
  # Networking
  networking.hostName = "pc";
  networking.networkmanager.enable = true;

  # Timezone
  time.timeZone = "Europe/Berlin";

  # Internationalisation
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };
  console.keyMap = "de-latin1-nodeadkeys";

  # Users
  users.users.bigschniff = {
    isNormalUser = true;
    description = "bigschniff";
    extraGroups = [ "networkmanager" "wheel" ];
    openssh.authorizedKeys.keys = [
    ];
  };
  
  security.polkit.enable = true;

  # SSH
  services.openssh = {                                                                       
    enable = true;                                                                  
    settings.PasswordAuthentication = false;                                                 
  };

  services.dbus.enable = true;

  services.displayManager.ly.enable = true;
  environment.etc."ly/custom-sessions/sway.desktop".text = 
  ''
  [Desktop Entry]
  Name=sway
  Comment= A Wayland compositor
  Exec= ${pkgs.dbus}/bin/dbus-run-session ${pkgs.swayfx}/bin/sway
  Type=Application
  '';
  # System version
  system.stateVersion = "26.05";
}
