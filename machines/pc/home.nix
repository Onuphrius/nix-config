{
  home.username = "bigschniff";
  home.homeDirectory = "/home/bigschniff";

  imports = [
    ../../modules/desktop
    ../../modules/common
    ../../modules/music
    ../../profile/pc.nix
  ];

  home.stateVersion = "26.05";
}
