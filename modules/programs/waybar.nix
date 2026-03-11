{ config, pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    settings = {
      mainBar = {
	layer = "top";
	position = "top";
	height = 12;
	spacing = 12;
	margin-top = 4;
	margin-right = 8;
	margin-left = 8;
	reload_style_on_change = true;
	modules-left = [ "sway/workspaces" "sway/mode" ];
	modules-right = [ "battery" "clock" ];
	
	"sway/workspaces" = {
	 disable-scroll = true;
	 all-outputs = true;
	 persistent-workspaces = { "1" = []; "2" = []; "3" = []; "4" = [];};
	};
      };
    };
    style = 
''
/* Transparent bar */
window#waybar {
  background: transparent;
  border: none;
}

/* Floating modules */
#workspaces,
#mode,
#clock {
  background: rgba(255, 255, 255, 0.85);
  color: #222222;

  padding: 4px;
  margin: 4px 0;

  border-radius: 4px;
  box-shadow: 0 2px 6px rgba(0, 0, 0, 0.06);
}

/* Workspace buttons */
#workspaces button {
  padding: 2px;
  color: #777777;
  background: transparent;
  border: none;
}

#workspaces button.focused {
  color: #000000;
  font-weight: 600;
}

#workspaces button.visible {
  color: #444444;
}

#workspaces button:hover {
  color: #000000;
}

/* Mode styling (only visible when active) */
#mode {
  color: #b00020;        /* subtle red accent */
  font-weight: 600;
}
'';
  };
}
