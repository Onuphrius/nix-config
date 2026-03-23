{config, pkgs, ...}:

{
  services.openssh.enable = true;
  users.users.root.initialPassword = "root";
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

}

