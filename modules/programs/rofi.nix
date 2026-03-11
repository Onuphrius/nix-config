{ config, pkgs, lib, ...}:

{
  programs.rofi = {
    enable = true;
    terminal = "LIBGL_ALWAYS_SOFTWARE=1 kitty";
    location = "bottom";
    extraConfig = {
    };
    theme = builtins.toFile "theme.rasi"
''
* {
	bg:				#b5b5aa;
	fg:				#2b2b2b;
	button:				#9e9e95;

	background-color:		@bg;
	text-color:			@fg;
}

window {
	transparency:                   "real";
	border-radius:                  6px;
	width:			   	30%;
	y-offset:                       6px;
	padding: 			10px;  	
	location: 			south;
}

prompt { enabled: false; }

entry {
	placeholder:			"Search";
	expand:                         true;
	padding:                        3px 1%;
	background-color:               @button;
        placeholder-color:              @fg;
}

inputbar {
	children: 			[ prompt, entry ];
	background-color:               @button;
	text-color:                     @fg;
	expand:                         false;
	border-radius:                  5px;
	padding:                        4px;
}

listview {
	columns:                        2;
	lines:	                       10;
	cycle:                          false;
	dynamic:                        true;
	layout:                         vertical;
	spacing:                        2px;
}

mainbox {
	children:                       [ inputbar, listview ];
	spacing:                       	6px;
	padding:                        6px;
}

element {
	orientation:                    vertical;
	border-radius:                  0%;
	padding:                        6px 0;
}

element-text {
	expand:                         true;
	vertical-align:                 0.5;
	margin:                         0 10px;
	background-color:               inherit;
        text-color:                     inherit;
}

element selected {
	background-color:               @fg;
	text-color:                     @bg;
	border-radius:                  5px;
}'';
  };
}
