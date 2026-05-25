{ config, pkgs, wallpapers, ... }:
{
  home.username = "lsd";
  home.homeDirectory = "/home/lsd";
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

  fonts.fontconfig.enable = true;
  fonts.fontconfig.defaultFonts = {
    monospace = [ "JetBrains Mono Nerd Font"];
    sansSerif = [ "JetBrains Mono Nerd Font"];
    serif = [ "JetBrains Mono Nerd Font"];
  };

  imports = [
    ../../modules/desktop
    ../../modules/common
    ../../modules/music
  ];

  #Wallpapers
  xdg.dataFile."wallpapers".source = wallpapers;
  home.stateVersion = "26.05";
}
