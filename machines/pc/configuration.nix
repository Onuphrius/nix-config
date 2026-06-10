{ pkgs, ... }:


{
  imports = [
    ./hardware.nix
    ./disko.nix
    ../../modules/nixos
    ../../modules/nixos/nvidia.nix
    ../../modules/nixos/ollama.nix
  ];
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;
  # Networking
  networking.hostName = "pc";
  networking.networkmanager.enable = true;

  # Users
  users.users.bigschniff = {
    initialPassword = "1111";
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [ "networkmanager" "wheel" ];
    openssh.authorizedKeys.keys = [
    ];
  };

  programs.zsh.enable = true;
  
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
          --cmd "${pkgs.swayfx}/bin/sway --unsupported-gpu"'';
	user = "greeter";

      };
    };
  };

    # System version
  system.stateVersion = "26.05";
}
