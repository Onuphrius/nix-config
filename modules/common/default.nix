{pkgs, ... }:
{
  home.packages = (with pkgs; [
    deadlock-mod-manager
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
    anydesk
    kicad
    qgis
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
