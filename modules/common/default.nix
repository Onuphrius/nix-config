{pkgs, ... }:
{
  home.packages = (with pkgs; [
    tree
    btop
  ]);

  imports = [
    ./git.nix
    ./kitty.nix
    ./librewolf.nix
    ./neovim.nix
    ./nnn.nix
    ./signal.nix
    ./shell.nix
  ];
}
