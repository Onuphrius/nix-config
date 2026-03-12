{ config, pkgs, wallpapers, ... }:
{
  home.username = "lsd";
  home.homeDirectory = "/home/lsd";
  home.packages = with pkgs; [

    # Utitlity
    fastfetch
    git
    file
    which
    tree

    # TUI
    nnn
    btop

    # Language Servers
    pyright
    rust-analyzer
    nil
    nixfmt
    
    #Font
    nerd-fonts.zed-mono
  ];
  
  imports = [
    ../../modules/programs/sway.nix
    ../../modules/programs/waybar.nix
    ../../modules/programs/kitty.nix
    ../../modules/programs/rofi.nix
    ../../modules/programs/neovim.nix
    ../../modules/programs/librewolf.nix
    ../../modules/programs/git.nix
    ../../modules/services/mpd.nix
  ];

  #Wallpapers
  xdg.dataFile."wallpapers".source = wallpapers;
  home.stateVersion = "25.11";
}
