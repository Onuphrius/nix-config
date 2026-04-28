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
	  border = "#EAEBEA";
	  childBorder = "#EAEBEA";
	  indicator = "#EAEBEA";
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
	{ command = "exec ${pkgs.waybar}/bin/waybar"; always=false;}
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
	"${modifier}+w" = ''exec rofi -show window -theme-str 'window { location: west; width: 20%;} inputbar {enabled: false;} listview {lines: 10; columns:1;}' -window-format "{t}"'';
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
