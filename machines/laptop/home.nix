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

  xdg.desktopEntries =  {
    rmpc = {
      name = "rmpc";
      genericName = "Music Player";
      exec = "rmpc %U";
      terminal = true;
      categories = ["Music" "Player"];
      mimeType=["audio/mpeg" "audio/x-mpegurl" "audio/ogg" "audio/flac"];
    };
  };
  imports = [
    ../../modules/programs/sway.nix
    ../../modules/programs/waybar.nix
    ../../modules/programs/kitty.nix
    ../../modules/programs/rofi.nix
    ../../modules/programs/neovim.nix
    ../../modules/programs/librewolf.nix
    ../../modules/programs/hyprlock.nix
    ../../modules/programs/git.nix
    ../../modules/programs/rmpc.nix
    ../../modules/services/mpd.nix
    ../../modules/services/swayidle.nix
    ../../modules/services/mako.nix
    ../../modules/services/wlsunset.nix
  ];

  #Wallpapers
  xdg.dataFile."wallpapers".source = wallpapers;
  home.stateVersion = "26.05";
}
