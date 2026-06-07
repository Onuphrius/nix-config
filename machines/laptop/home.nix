{
  home.username = "lsd";
  home.homeDirectory = "/home/lsd";

  imports = [
    ../../modules/desktop
    ../../modules/common
    ../../modules/music
    ../../profile/laptop.nix
  ];
  home.stateVersion = "26.05";
}
