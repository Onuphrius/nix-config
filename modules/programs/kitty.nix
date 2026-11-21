{
  flake.modules.homeManager.kitty = {config, lib, ...}: {
    programs.kitty = {
      enable = true;
      font = {
	name = "JetBrains Mono Nerd Font";
	size = 12;
      };
      keybindings = {
	"ctrl+c" = "copy_or_interrupt";
	"ctrl+v" = "paste_from_clipboard";
      };
      settings = {
	background_opacity = 0.95;
	enable_audio_bell = false;
	background = "#1C1C1C";
	foreground = "#FFFFFF";
	confirm_os_window_close = 0;
      };
      shellIntegration.enableZshIntegration = true;
      enableGitIntegration = true;
    };
    wayland.windowManager.sway.extraSessionCommands = lib.mkIf config.wayland.windowManager.sway.enable [
      ''export WLR_RENDER_NO_EXPLICIT_SYNC=1''
    ];
  };
}
