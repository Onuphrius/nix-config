{config, pkgs, ...}:

{
  services.openssh.enable = true;
  users.users.root.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEwjaEC3NMfbKZ+YTTmcjUBUiqRLZZZJz8vuaODEmE8F bigschiff@pc"
  ];
  users.users.root.initialPassword = "root";
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  script = "
  #Disko command
  sudo nixos-generate-config --no-filesystems --root /mnt
  ";

}

