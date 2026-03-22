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
      colors = {
	focused = {
	  background = "#285577";
	  border = "#c4c4c4";
	  childBorder = "#c4c4c4";
	  indicator = "#c4c4c4";
	  text = "#ffffff";
	};

      };
      focus.followMouse = "no";
      floating.border = 1;
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
	 bg = "${wallpapers}/mountain.jpg fill";
	};
      };
      startup = [
	#{ command = ""; always=true;}
      ];
      window.border = 2;
      window.titlebar = false;
      workspaceAutoBackAndForth = true;
      window.commands = [
	{ command = "border 1"; criteria= { floating = true; }; }
      ];
      keybindings = let modifier = cfg.modifier; in lib.mkOptionDefault {
	"${modifier}+q" = "kill";
	"${modifier}+t" = "exec ${cfg.terminal}";
	"${modifier}+s" = ''exec grim -g "$(slurp)" - | wl-copy'';
	"${modifier}+l" = "exec hyprlock";
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
