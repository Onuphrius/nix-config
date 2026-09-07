{pkgs, ... }:
{
  home.packages = (with pkgs; [
    tree
    btop-cuda
    obsidian
    prismlauncher
    arduino-ide
    python3
    freecad
    vesktop
    gimp
    yubikey-manager
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
