{ config, pkgs, wallpapers, ... }:
{
  home.username = "bigschniff";
  home.homeDirectory = "/home/bigschniff";
  home.packages = (with pkgs; [

    # Utitlity
    fastfetch
    git
    file
    which
    tree
    wl-clipboard
    pwvucontrol
    pavucontrol
    wl-color-picker
    #Screenshot
    grim
    slurp

    # TUI
    nnn
    btop

    # Language Servers
      #Python
    pyright
      #Rust
    rust-analyzer
      #Nix
    nil
    nixfmt
    
    #Font
    nerd-fonts.jetbrains-mono

    #Music
    yt-dlp
    spotdl

    #Library
    libnotify

    #3d printing
    orca-slicer
    freecad
    octoprint


  ]);

  
  imports = [
    ../../modules/desktop
    ../../modules/common
    ../../modules/music
  ];

  #Wallpapers
  xdg.dataFile."wallpapers".source = wallpapers;
  home.stateVersion = "26.05";
}
