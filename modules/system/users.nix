{
  flake.modules.nixos.user_bigschniff = {pkgs, ...}: {
    programs.zsh.enable = true;
    users.users.bigschniff = {
      initialPassword = "1111";
      isNormalUser = true;
      shell = pkgs.zsh;
      extraGroups = [ "networkmanager" "wheel" "dialout"];
      openssh.authorizedKeys.keys = [	      
      ];
    };
  };
}
