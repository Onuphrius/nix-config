{pkgs, ...}:

{
  home.packages = (with pkgs; [
    nerd-fonts.jetbrains-mono
  ]);

  fonts.fontconfig.enable = true;
  fonts.fontconfig.defaultFonts = {
    monospace = [ "JetBrains Mono Nerd Font"];
    sansSerif = [ "JetBrains Mono Nerd Font"];
    serif = [ "JetBrains Mono Nerd Font"];
  };

}
