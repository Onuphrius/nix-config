{ config, pkgs, lib, wallpapers, ...}:
#https://nix-community.github.io/home-manager/options.xhtml#opt-wayland.windowManager.sway.config
let
  cfg = config.wayland.windowManager.sway.config;
in {
  wayland.windowManager.sway = {
    enable = true;
    package = pkgs.swayfx;
    wrapperFeatures = {gtk = true;};
    config = {
      modifier = "mod4";
      bars = [];
      colors = {};
      focus.followMouse = "no";
      floating.border = 0;
      defaultWorkspace = "workspace number 1";
      gaps = {
	inner = 5;
	outer = 5;
	top = 0;
      };
      input = {
	"*" = {
	 xkb_layout = "de";
	 xkb_numlock = "enable";
	};
      };
      menu = "rofi -show drun";
      terminal = "kitty";
      output = {
       "*" = {
	 bg = "${wallpapers}/dark_queen.jpg fill";
	};
      };
      startup = [
	#{ command = ""; always=true;}
      ];
      window.border = 0;
      window.titlebar = false;
      window.commands = [
	{ command = "border none"; criteria= { floating = true; }; }
      ];
      keybindings = let modifier = cfg.modifier; in lib.mkOptionDefault {
	"${modifier}+q" = "kill";
	"${modifier}+t" = "exec ${cfg.terminal}";
      };


    };
    checkConfig = false;
    extraConfig = ''
    shadows enable
    corner_radius 4
    blur_radius 6
    blur_passes 2
    '';

  };
}
