{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    keybindings = {
      "ctrl+c" = "copy_or_interrupt";
      "ctrl+v" = "paste_from_clipboard";
    };
    settings = {
      background_opacity = 0.95;
      enable_audio_bell = false;
      backgorund = "#1C1C1C";
      foreground = "#FFFFFF";
      confirm_os_window_close = 0;

      #font = {
      #	size = 12;
      #};
    };
  };
}
